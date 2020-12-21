load("//transitions:defs.bzl", "my_pkg_tar")

platform(
    name = "mac_x86",
    constraint_values = [
        "//os:mac",
        "//cpu:mac",
    ]
)

my_pkg_tar(
    name = "mac",
    srcs = [
        "//apps/hello:hello",
    ],
    set_platforms = "//boards/mac:mac_x86",
)
