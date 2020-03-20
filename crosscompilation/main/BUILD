load("//toolchain:hex.bzl", "hex")

MCU = "atmega1284p"
F_CPU = "11059200"

COPTS = [
    "-mmcu="+MCU, "-DF_CPU="+F_CPU,
    "-c",
    "-Os",
    "-Wall", "-Werror", "-Wextra",
]

LINKOPTS = [
    "-mmcu="+MCU, "-DF_CPU="+F_CPU,
]

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
