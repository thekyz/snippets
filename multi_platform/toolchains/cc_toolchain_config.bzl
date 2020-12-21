load("@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl",
     "feature",
     "flag_group",
     "flag_set",
     "tool_path")

load("@bazel_tools//tools/build_defs/cc:action_names.bzl", "ACTION_NAMES")

all_link_actions = [
   ACTION_NAMES.cpp_link_executable,
   ACTION_NAMES.cpp_link_dynamic_library,
   ACTION_NAMES.cpp_link_nodeps_dynamic_library,
]

all_compile_actions = [
   ACTION_NAMES.c_compile,
   ACTION_NAMES.cpp_compile,
   ACTION_NAMES.linkstamp_compile,
]


def _impl(ctx):
    tool_paths = [
        tool_path(
            name = "gcc",
            path = "host/bin/" + ctx.attr.cross_prefix + "gcc",
        ),
        tool_path(
            name = "ld",
            path = "host/bin/" + ctx.attr.cross_prefix + "ld",
        ),
        tool_path(
            name = "ar",
            path = "host/bin/" + ctx.attr.cross_prefix + "ar",
        ),
        tool_path(
            name = "cpp",
            path = "host/bin/" + ctx.attr.cross_prefix + "cpp",
        ),
        tool_path(
            name = "gcov",
            path = "host/bin/" + ctx.attr.cross_prefix + "gcov",
        ),
        tool_path(
            name = "nm",
            path = "host/bin/" + ctx.attr.cross_prefix + "nm",
        ),
        tool_path(
            name = "objdump",
            path = "host/bin/" + ctx.attr.cross_prefix + "objdump",
        ),
        tool_path(
            name = "strip",
            path = "host/bin/" + ctx.attr.cross_prefix + "strip",
        ),
    ]

    features = []
    if ctx.attr.nosys_specs:
        features.append(
            feature(
                name = "default_linker_flags",
                enabled = True,
                flag_sets = [
                    flag_set(
                        actions = all_link_actions,
                        flag_groups = ([
                            flag_group(
                                flags = [
                                    "--specs=nosys.specs",
                                ],
                            ),
                        ]),
                    ),
                ],
            )
        )

    return cc_common.create_cc_toolchain_config_info(
        ctx = ctx,
        features = features,
        toolchain_identifier = ctx.attr.cross_prefix + "-toolchain",
        host_system_name = "i686-linux-gnu",
        target_system_name = ctx.attr.cross_prefix,
        target_cpu = "cpu",
        target_libc = "unkown",
        compiler = "gcc",
        abi_version = "unkown",
        abi_libc_version = "unkown",
        tool_paths = tool_paths,
        builtin_sysroot = ctx.attr.toolchain_path,
        cxx_builtin_include_directories = [
            ctx.attr.toolchain_path + 'host/arm-none-eabi/include',
            ctx.attr.toolchain_path + 'host/lib/gcc/arm-none-eabi/9.3.1/include',
            '/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/',
        ],
    )


cc_toolchain_config = rule(
    implementation = _impl,
    attrs = {
        "cross_prefix": attr.string(mandatory=True),
        "toolchain_path": attr.string(mandatory=True),
        "nosys_specs": attr.bool(default=False, mandatory=False),
    },
    provides = [CcToolchainConfigInfo]
)
