load("@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl", "tool_path")

def _avr_toolchain_impl(ctx):
    tool_paths = [
        tool_path(
            name = "gcc",
            path = "/usr/bin/avr-gcc",
        ),
        tool_path(
            name = "ld",
            path = "/usr/bin/avr-ld",
        ),
        tool_path(
            name = "ar",
            path = "/usr/bin/avr-ar",
        ),
        tool_path(
            name = "as",
            path = "/usr/bin/avr-as",
        ),
        tool_path(
            name = "cpp",
            path = "/usr/bin/avr-cpp",
        ),
        tool_path(
            name = "gcov",
            path = "/usr/bin/avr-gcov",
        ),
        tool_path(
            name = "nm",
            path = "/usr/bin/avr-gcc-nm",
        ),
        tool_path(
            name = "objcopy",
            path = "/usr/bin/avr-objcopy",
        ),
        tool_path(
            name = "objdump",
            path = "/usr/bin/avr-objdump",
        ),
        tool_path(
            name = "size",
            path = "/usr/bin/avr-size",
        ),
        tool_path(
            name = "strip",
            path = "/usr/bin/avr-strip",
        ),
    ]
    return cc_common.create_cc_toolchain_config_info(
        ctx = ctx,
        toolchain_identifier = "avr-toolchain",
        host_system_name = "x86_64-pc-linux-gnu",
        target_system_name = "avr",
        target_cpu = "avr",
        target_libc = "avr",
        compiler = "avr-gcc",
        abi_version = "avr",
        abi_libc_version = "avr",
        tool_paths = tool_paths,
        cxx_builtin_include_directories = [
            "/usr/lib/gcc/avr/5.4.0/include",
            "/usr/lib/gcc/avr/5.4.0/include-fixed",
            "/usr/lib/avr/include",
        ],
        builtin_sysroot = "",
    )

cc_toolchain_config = rule(
    implementation = _avr_toolchain_impl,
    attrs = {},
    provides = [CcToolchainConfigInfo],
)
