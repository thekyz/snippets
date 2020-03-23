package(default_visibility = ["//visibility:public"])

filegroup(
    name = "all",
    srcs = glob([
        "bin/avr-*",
        "lib/avr/**",
        "lib/gcc/avr/5.4.0/**",
    ]),
)

# filegroup(
#     name = "bin_folder",
#     srcs = ["bin"],
# )
# 
# filegroup(
#     name = "lib_avr_folder",
#     srcs = ["lib/avr"],
# )
# 
# filegroup(
#     name = "lib_gcc_avr_folder",
#     srcs = ["lib/gcc/avr/5.4.0"],
# )

filegroup(
    name = "gcc",
    srcs = ["bin/avr-gcc"],
)

filegroup(
    name = "ld",
    srcs = ["bin/avr-ld"],
)

filegroup(
    name = "ar",
    srcs = ["bin/avr-ar"],
)

filegroup(
    name = "as",
    srcs = ["bin/avr-as"],
)

filegroup(
    name = "cpp",
    srcs = ["bin/avr-cpp"],
)

filegroup(
    name = "gcov",
    srcs = ["bin/avr-gcov"],
)

filegroup(
    name = "nm",
    srcs = ["bin/avr-gcc-nm"],
)

filegroup(
    name = "objcopy",
    srcs = ["bin/avr-objcopy"],
)

filegroup(
    name = "objdump",
    srcs = ["bin/avr-objdump"],
)

filegroup(
    name = "size",
    srcs = ["bin/avr-size"],
)

filegroup(
    name = "strip",
    srcs = ["bin/avr-strip"],
)

filegroup(
    name = "compiler_lib",
    srcs = glob([
        "lib/avr/include/**",
        "lib/avr/lib/**",
        "lib/avr/x86_64-linux-gnu/**",
        "lib/gcc/avr/5.4.0/**",
    ]),
)

filegroup(
    name = "compiler",
    srcs = [
        ":gcc",
        ":ld",
        ":as",
    ],
)

filegroup(
    name = "linker",
    srcs = [
        ":gcc",
        ":ld",
        ":ar",
        ":compiler_lib",
    ],
)

# Empty filegroups
filegroup(name = "dwp")
