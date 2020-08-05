HelloBaseInfo = provider(
    fields = {
        'srcs': 'all compiled files',
        'cmds': 'all compilation commands',
    }
)

def _hello_base_aspect_impl(target, ctx):
    srcs = []
    cmds = []
    for action in target.actions:
        if action.mnemonic == 'CppCompile':
            for input in action.inputs.to_list():
                if input.extension == 'c' or input.extension == 'cpp':
                    srcs.append(input)
            cmds.append(' '.join(action.argv))
    for dep in ctx.rule.attr.deps:
        cmds.extend(dep[HelloBaseInfo].cmds)

    return [
        HelloBaseInfo(
            srcs = srcs,
            cmds = cmds,
        )
    ]

hello_base_aspect = aspect(
    implementation = _hello_base_aspect_impl,
    attr_aspects = ['deps'],
)

def _hello_base_rule_impl(ctx):
    outfiles = []
    info = ctx.attr.library[HelloBaseInfo]
    for i in range(len(info.cmds)):
        src = info.srcs[i]
        outfile = ctx.actions.declare_file(src.basename + '.base', sibling=src)
        ctx.actions.run(
            inputs = [src],
            outputs = [outfile],
            tools = [ctx.executable._hello_base],
            executable = ctx.executable._hello_base,
            arguments = [src.path, info.cmds[i], outfile.path],
            mnemonic = 'HelloBase',
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
