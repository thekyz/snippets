load("@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl", "tool_path")

def _avr_toolchain_impl(ctx):
    bin_ = ctx.attr.bin
    lib_avr = ctx.attr.lib_avr
    lib_gcc_avr = ctx.attr.lib_gcc_avr
    tool_paths = [
        tool_path(
            name = "gcc",
            path = bin_+"/avr-gcc",
        ),
        tool_path(
            name = "ld",
            path = bin_+"/avr-ld",
        ),
        tool_path(
            name = "ar",
            path = bin_+"/avr-ar",
        ),
        tool_path(
            name = "as",
            path = bin_+"/avr-as",
        ),
        tool_path(
            name = "cpp",
            path = bin_+"/avr-cpp",
        ),
        tool_path(
            name = "gcov",
            path = bin_+"/avr-gcov",
        ),
        tool_path(
            name = "nm",
            path = bin_+"/avr-gcc-nm",
        ),
        tool_path(
            name = "objcopy",
            path = bin_+"/avr-objcopy",
        ),
        tool_path(
            name = "objdump",
            path = bin_+"/avr-objdump",
        ),
        tool_path(
            name = "size",
            path = bin_+"/avr-size",
        ),
        tool_path(
            name = "strip",
            path = bin_+"/avr-strip",
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
            lib_gcc_avr+"/include",
            lib_gcc_avr+"/include-fixed",
            lib_avr+"/include",
        ],
        builtin_sysroot = "",
    )

cc_toolchain_config = rule(
    implementation = _avr_toolchain_impl,
    attrs = {
        "bin" : attr.string(default="/usr/bin"),
        "lib_avr" : attr.string(default="/usr/lib/avr"),
        "lib_gcc_avr" : attr.string(default="/usr/lib/gcc/avr/5.4.0"),
    },
    provides = [CcToolchainConfigInfo],
)
