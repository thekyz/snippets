load("//toolchain:flags.bzl", "COPTS", "LINKOPTS")
load("//toolchain:hex.bzl", "hex")

cc_binary(
    name = "blinking-led",
    srcs = ["blinking.c"],
    copts = COPTS,
    linkopts = LINKOPTS,
)

hex(
    name = "led",
    binary_target = ":blinking-led",
)
