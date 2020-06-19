def _build_manifest_impl(ctx):
    args = ctx.actions.args()
    args.add(ctx.files.template[0])
    args.add(ctx.version_file)
    args.add(ctx.outputs.out)
            
    ctx.actions.run(
        inputs = ctx.files.template + [ctx.version_file],
        arguments = [args],
        progress_message = "Generating build info: " + ctx.label.name,
        outputs = [ctx.outputs.out],
        executable = ctx.executable._gen_script,
    )

build_manifest = rule(
    implementation = _build_manifest_impl,
    attrs = {
        "template": attr.label(mandatory=True, allow_single_file=[".h.tmpl"]),
        "_gen_script": attr.label(default=Label("//:gen_build_info"), executable=True, cfg="host")
    },
    outputs = {"out": "build_info.h"},
)
