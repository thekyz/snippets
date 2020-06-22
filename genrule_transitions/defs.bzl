NATIVE_GENRULE_DIR = "native_tmp"


def _binary_copt_transition_impl(settings, attr):
    return {"//custom_settings:mycopts": attr.set_features[:]}

def _gen_copt_transition_impl(settings, attr):
    return {"//custom_settings:mycopts": ["_default_genrule_config"]}

_binary_copt_transition = transition(
    implementation = _binary_copt_transition_impl,
    inputs = ["//custom_settings:mycopts"],
    outputs = ["//custom_settings:mycopts"],
)

_gen_copt_transition = transition(
    implementation = _gen_copt_transition_impl,
    inputs = ["//custom_settings:mycopts"],
    outputs = ["//custom_settings:mycopts"],
)


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
        actual_binary[CcInfo],
    ]

def _gen_transition_rule_impl(ctx):
    actual_genrule = ctx.attr.actual_genrule[0]
    actual_outfiles = actual_genrule[DefaultInfo].files.to_list()

    outfiles = []
    for actual_outfile in actual_outfiles:
        outfile_name = actual_outfile.path.split(NATIVE_GENRULE_DIR + "/")[1]
        outfile = ctx.actions.declare_file(outfile_name)
        ctx.actions.symlink(
            output = outfile,
            target_file = actual_outfile,
        )
        outfiles.append(outfile)
    return [DefaultInfo(files=depset(outfiles))]


binary_transition_rule = rule(
    implementation = _binary_transition_rule_impl,
    attrs = {
        "set_features": attr.string_list(default = []),
        "actual_binary": attr.label(cfg = _binary_copt_transition),
        "_whitelist_function_transition": attr.label(
            default = "@bazel_tools//tools/whitelists/function_transition_whitelist",
        ),
    },
    executable = True,
)

gen_transition_rule = rule(
    implementation = _gen_transition_rule_impl,
    attrs = {
        "actual_genrule": attr.label(cfg = _gen_copt_transition),
        "outs": attr.output_list(),
        "_whitelist_function_transition": attr.label(
            default = "@bazel_tools//tools/whitelists/function_transition_whitelist",
        ),
    },
)

def cc_binary(name, set_features = [], **kwargs):
    cc_binary_name = "native_binary_" + name
    binary_transition_rule(
        name = name,
        actual_binary = ":%s" % cc_binary_name,
        set_features = set_features,
    )
    native.cc_binary(
        name = cc_binary_name,
        **kwargs
    )

def genrule(name, outs, cmd, visibility=["//visibility:private"], **kwargs):
    genrule_name = "native_genrule_" + name
    native_cmd = cmd
    gen_transition_rule(
        name = name,
        outs = outs,
        actual_genrule = ":" + genrule_name,
        visibility = visibility,
    )

    native_outs = []
    for out in outs:
        native_out = NATIVE_GENRULE_DIR + "/" + out
        native_outs.append(native_out)
        native_cmd = native_cmd.replace("$(location " + out + ")",
                                        "$(location " + native_out + ")")
    native_cmd = native_cmd.replace("$(RULEDIR)", "$(RULEDIR)/" + NATIVE_GENRULE_DIR)
    if "$(@D)" in native_cmd:
        # Mimic native rule logic
        if len(outs) == 1:
            out_subdir = outs[0].rsplit("/", 1)[0]
            native_cmd = native_cmd.replace("$(@D)",
                                            "$(RULEDIR)/" + NATIVE_GENRULE_DIR + "/" + out_subdir)
        else:
            native_cmd = native_cmd.replace("$(@D)", "$(@D)/" + NATIVE_GENRULE_DIR)

    native.genrule(
        name = genrule_name,
        outs = native_outs,
        cmd = native_cmd,
        visibility = ["//visibility:private"],
        **kwargs
    )
