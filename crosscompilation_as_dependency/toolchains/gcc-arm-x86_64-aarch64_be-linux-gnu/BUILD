package(default_visibility = ["//visibility:public"])

load(":cc_toolchain_config.bzl", "cc_toolchain_config")

cc_toolchain_config(
    name = "gcc-arm-x86_64-aarch64_be-linux-gnu-cc_toolchain_config",
)

cc_toolchain_suite(
    name = "toolchain_suite",
    toolchains = {
        "aarch64": ":aarch64_be-cc_toolchain",
    },
    tags = ["manual"]
)

cc_toolchain(
    name = "aarch64_be-cc_toolchain",
    toolchain_identifier = "gcc-arm-x86_64-aarch64_be-linux-gnu-toolchain",
    toolchain_config = ":gcc-arm-x86_64-aarch64_be-linux-gnu-cc_toolchain_config",
    all_files = ":all_files",
    compiler_files = ":all_files",
    dwp_files = ":empty",
    linker_files = ":all_files",
    objcopy_files = ":empty",
    strip_files = ":empty",
)

filegroup(
    name = "empty"
)

filegroup(
    name = "wrappers",
    srcs = glob([
        "wrappers/**",
    ]),
)

filegroup(
    name = "all_files",
    srcs = [
        "@sysroot-glibc-x86_64-aarch64_be-linux-gnu//:sysroot",
        "@gcc-arm-x86_64-aarch64_be-linux-gnu//:toolchain",
        ":wrappers",
    ],
)
