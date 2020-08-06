HelloBaseInfo = provider(
    fields = {
        'src_cmd_mapping': 'mapping from source file to their compilation command',
    }
)

def _hello_base_aspect_impl(target, ctx):
    src_cmd_mapping = {}
    for action in target.actions:
        if action.mnemonic == 'CppCompile':
            for input in action.inputs.to_list():
                if input.extension == 'c' or input.extension == 'cpp':
                    break
            src_cmd_mapping[input] = ' '.join(action.argv)

    for dep in ctx.rule.attr.deps:
        src_cmd_mapping.update(dep[HelloBaseInfo].src_cmd_mapping)

    return [HelloBaseInfo(src_cmd_mapping=src_cmd_mapping)]

hello_base_aspect = aspect(
    implementation = _hello_base_aspect_impl,
    attr_aspects = ['deps']
)

def _hello_base_rule_impl(ctx):
    outfiles = []
    src_cmd_mapping = ctx.attr.library[HelloBaseInfo].src_cmd_mapping
    for src in src_cmd_mapping:
        outfile = ctx.actions.declare_file(src.basename + '.base', sibling=src)
        ctx.actions.run(
            inputs = [src],
            outputs = [outfile],
            tools = [ctx.executable._hello_base],
            executable = ctx.executable._hello_base,
            arguments = [src.path, src_cmd_mapping[src], outfile.path],
            mnemonic = 'HelloBase',
            progress_message = "Hello basing " + src.path,
        )
        outfiles.append(outfile)
    return [DefaultInfo(files = depset(outfiles))]

hello_base_rule = rule(
    implementation = _hello_base_rule_impl,
    attrs = {
        'library': attr.label(aspects = [hello_base_aspect]),
        '_hello_base': attr.label(
            executable = True,
            cfg = 'host',
            default = '//hello_tools:hello_base',
        ),
    },
)

def _hello_gather_rule_impl(ctx):
    inputs = []
    for dep in ctx.attr.deps:
        inputs.extend(dep.files.to_list())
    outfile = ctx.actions.declare_file(ctx.attr.name + '.gather')
    ctx.actions.run(
        inputs = inputs,
        outputs = [outfile],
        tools = [ctx.executable._hello_gather],
        executable = ctx.executable._hello_gather,
        arguments = [i.path for i in inputs] + [outfile.path],
        mnemonic = 'HelloGather',
        progress_message = "Hello gathering " + ctx.attr.name,
    )
    return [DefaultInfo(files = depset([outfile]))]

hello_gather_rule = rule(
    implementation = _hello_gather_rule_impl,
    attrs = {
        'deps': attr.label_list(),
        '_hello_gather': attr.label(
            executable = True,
            cfg = 'host',
            default = '//hello_tools:hello_gather',
        ),
    },
)
