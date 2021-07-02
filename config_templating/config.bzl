def _apply_config_impl(ctx):
    out = ctx.actions.declare_file(ctx.label.name + ".h")
    ctx.actions.expand_template(
        output = out,
        template = ctx.file.template,
        substitutions = ctx.attr.config,
    )
    return [DefaultInfo(files = depset([out]))]

apply_config = rule(
    implementation = _apply_config_impl,
    attrs = {
        "config": attr.string_dict(
            mandatory = True,
        ),
        "template": attr.label(
            default = Label("//:config.h.tpl"),
            allow_single_file = [".h.tpl"],
        ),
    },
)
