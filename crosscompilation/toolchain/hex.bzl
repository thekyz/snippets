def _hex_impl(ctx):
    output = ctx.actions.declare_file(ctx.label.name+".hex")
    binary = ctx.file.binary_target
    ctx.actions.run_shell(
        outputs = [output],
        inputs = [binary],
        tools = [
            ctx.executable._objcopy,
        ],
        progress_message = "Creating code and data HEX file from %s" % binary.short_path,
        command = "%s -j .text -j .data -O ihex %s %s" % ( \
                ctx.executable._objcopy.path,
                binary.path,
                output.path,
        )
    )
    return [DefaultInfo(files = depset([output]))]

hex = rule(
    implementation = _hex_impl,
    attrs={
        "binary_target": attr.label(mandatory=True, allow_single_file=True),
        "_objcopy": attr.label(
                allow_single_file=True,
                executable=True,
                cfg="host",
                default=Label("@avr_tools//:objcopy")
        ),
    }
)
