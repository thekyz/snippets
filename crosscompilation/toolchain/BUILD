package(default_visibility = ['//visibility:public'])

load(":cc_toolchain_config.bzl", "cc_toolchain_config")

cc_toolchain_config(
    name = "avr_toolchain_config",
    bin = "/usr/bin",
    lib_avr = "/usr/lib/avr",
    lib_gcc_avr = "/usr/lib/gcc/avr/5.4.0",
)

cc_toolchain(
    name = "avr_toolchain",
    toolchain_identifier = "avr-toolchain",
    toolchain_config = ":avr_toolchain_config",
    all_files = "@avr_tools//:all",
    compiler_files = "@avr_tools//:compiler",
    dwp_files = "@avr_tools//:dwp",
    linker_files = "@avr_tools//:linker",
    objcopy_files = "@avr_tools//:objcopy",
    strip_files = "@avr_tools//:strip",
    supports_param_files = 1,
)

cc_toolchain_suite(
    name = "avr-gcc",
    toolchains = {
        # cpu: toolchain,
        "avr": ":avr_toolchain",
    },
)
