load("@rules_pkg//:pkg.bzl", "pkg_tar")

def _platforms_transition_impl(settings, attr):
    # settings provides read access to existing flags. But
    # this transition doesn't need to read any flags.
    return {"//command_line_option:platforms": attr.set_platforms}

# This defines a Starlark transition and which flags it reads and
# writes. In this case we don't need to read any flags - we
# universally set --/custom_settings:mycopts according to whatever
# is set in the owning rule's "set_features" attribute.
_platforms_transition = transition(
    implementation = _platforms_transition_impl,
    inputs = [],
    outputs = ["//command_line_option:platforms"],
)

# The implementation of transition_rule: all this does is copy the
# cc_binary's output to its own output and propagate its runfiles
# and executable to use for "$ bazel run".
#
# This makes transition_rule as close to a pure wrapper of cc_binary
# as possible.
def _transition_rule_impl(ctx):
    actual_pkg = ctx.attr.actual_pkg[0]
    outfile = ctx.actions.declare_file(ctx.label.name)
    cc_binary_outfile = actual_pkg[DefaultInfo].files.to_list()[0]

    ctx.actions.run_shell(
        inputs = [cc_binary_outfile],
        outputs = [outfile],
        command = "cp %s %s" % (cc_binary_outfile.path, outfile.path),
    )
    return [
        DefaultInfo(
            executable = outfile,
            data_runfiles = actual_pkg[DefaultInfo].data_runfiles,
        ),
    ]

# The purpose of this rule is to take a "set_features" attribute,
# invoke a transition that sets --//custom_settings:mycopts to the
# desired feature, then depend on a cc_binary whose deps will now
# be able to select() on that feature.
#
# You could add a transition_rule directly in your BUILD file. But for
# convenience we also define a cc_binary macro below so the BUILD can look
# as close to normal as possible.
transition_rule = rule(
    implementation = _transition_rule_impl,
    attrs = {
    	# This is where the user can set the feature they want.
        "set_platforms": attr.string(default = "@local_config_platform//:host"),
	# This is the cc_binary whose deps will select() on that feature.
	# Note specificaly how it's configured with _copt_transition, which
	# ensures that setting propagates down the graph.
        "actual_pkg": attr.label(cfg = _platforms_transition),
	# This is a stock Bazel requirement for any rule that uses Starlark
	# transitions. It's okay to copy the below verbatim for all such rules.
	#
	# The purpose of this requirement is to give the ability to restrict
	# which packages can invoke these rules, since Starlark transitions
	# make much larger graphs possible that can have memory and performance
	# consequences for your build. The whitelist defaults to "everything".
	# But you can redefine it more strictly if you feel that's prudent.
        "_whitelist_function_transition": attr.label(
            default = "@bazel_tools//tools/whitelists/function_transition_whitelist",
        ),
    },
    # Making this executable means it works with "$ bazel run".
    executable = True,
)

# Convenience macro: this instantiates a transition_rule with the given
# desired features, instantiates a cc_binary as a dependency of that rule,
# and fills out the cc_binary with all other parameters passed to this macro.
#
# The result is a wrapper over cc_binary that "magically" gives it a new
# feature-setting attribute. The only difference for a BUILD user is they need
# to load() this at the top of the BUILD file.
def my_pkg_tar(name, set_platforms = None, **kwargs):
    pkg_tar_name = name + "_native_pkg"
    transition_rule(
        name = name,
        actual_pkg = ":%s" % pkg_tar_name,
        set_platforms = set_platforms,
    )
    pkg_tar(
        name = pkg_tar_name,
        **kwargs
    )
