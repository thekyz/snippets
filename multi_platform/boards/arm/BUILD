load("//transitions:defs.bzl", "my_pkg_tar")

platform(
    name = "mac_arm",
    constraint_values = [
        "//os:mac",
        "//cpu:arm",
    ],
)

my_pkg_tar(
    name = "arm",
    srcs = [
        "//apps/hello:hello",
    ],
    set_platforms = "//boards/arm:mac_arm",
)
