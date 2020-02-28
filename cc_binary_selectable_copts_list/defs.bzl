def _binary_copt_transition_impl(settings, attr):
    return {"//custom_settings:mycopts": attr.set_features + settings["//custom_settings:mycopts"]}

_binary_copt_transition = transition(
    implementation = _binary_copt_transition_impl,
    inputs = ["//custom_settings:mycopts"],
    outputs = ["//custom_settings:mycopts"],
)

def _library_copt_transition_impl(settings, attr):
    features = []
    for feat in settings["//custom_settings:mycopts"]:
        if feat in attr.capabilities:
            features.append(feat)

    return {"//custom_settings:mycopts": features}

_library_copt_transition = transition(
    implementation = _library_copt_transition_impl,
    inputs = ["//custom_settings:mycopts"],
    outputs = ["//custom_settings:mycopts"],
)

# The implementation of transition_rule: all this does is copy the
# cc_binary's output to its own output and propagate its runfiles
# and executable to use for "$ bazel run".
#
# This makes transition_rule as close to a pure wrapper of cc_binary
# as possible.
def _binary_transition_rule_impl(ctx):
    actual_binary = ctx.attr.actual_binary[0]
    outfile = ctx.actions.declare_file(ctx.label.name)
    cc_binary_outfile = actual_binary[DefaultInfo].files.to_list()[0]

    ctx.actions.run_shell(
        inputs = [cc_binary_outfile],
        outputs = [outfile],
        command = "cp %s %s" % (cc_binary_outfile.path, outfile.path),
    )
    return [
        DefaultInfo(
            executable = outfile,
            data_runfiles = actual_binary[DefaultInfo].data_runfiles,
        ),
    ]

def _library_transition_rule_impl(ctx):
    actual_library = ctx.attr.actual_library[0]
    #print(actual_library[CcInfo])

    return [ actual_library[CcInfo] ]

# The purpose of this rule is to take a "set_features" attribute,
# invoke a transition that sets --//custom_settings:mycopts to the
# desired feature, then depend on a cc_binary whose deps will now
# be able to select() on that feature.
#
# You could add a transition_rule directly in your BUILD file. But for
# convenience we also define a cc_binary macro below so the BUILD can look
# as close to normal as possible.
binary_transition_rule = rule(
    implementation = _binary_transition_rule_impl,
    attrs = {
        # This is where the user can set the feature they want.
        "set_features": attr.string_list(default = ["unset"]),
        "actual_binary": attr.label(cfg = _binary_copt_transition),
        "_whitelist_function_transition": attr.label(
            default = "@bazel_tools//tools/whitelists/function_transition_whitelist",
        ),
    },
    # Making this executable means it works with "$ bazel run".
    executable = True,
)

library_transition_rule = rule(
    implementation = _library_transition_rule_impl,
    attrs = {
        # This is where the user can set the feature they want.
        "capabilities": attr.string_list(default = ["unset"]),
        "actual_library": attr.label(cfg = _library_copt_transition),
        "_whitelist_function_transition": attr.label(
            default = "@bazel_tools//tools/whitelists/function_transition_whitelist",
        ),
    },
)

# Convenience macro: this instantiates a transition_rule with the given
# desired features, instantiates a cc_binary as a dependency of that rule,
# and fills out the cc_binary with all other parameters passed to this macro.
#
# The result is a wrapper over cc_binary that "magically" gives it a new
# feature-setting attribute. The only difference for a BUILD user is they need
# to load() this at the top of the BUILD file.
def cc_binary(name, set_features = [], **kwargs):
    cc_binary_name = name + "_native_binary"
    binary_transition_rule(
        name = name,
        actual_binary = ":%s" % cc_binary_name,
        set_features = set_features,
    )
    native.cc_binary(
        name = cc_binary_name,
        **kwargs
    )

def cc_library(name, capabilities = [], **kwargs):
    cc_library_name = name + "_native_library"
    library_transition_rule(
        name = name,
        actual_library = ":%s" % cc_library_name,
        capabilities = capabilities,
    )
    native.cc_library(
        name = cc_library_name,
        **kwargs
    )
