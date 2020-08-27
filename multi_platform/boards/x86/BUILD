load("//transitions:defs.bzl", "my_pkg_tar")

platform(
    name = "linux_x86",
    constraint_values = [
        "//os:linux",
        "//cpu:x86",
    ]
)

my_pkg_tar(
    name = "x86",
    srcs = [
        "//apps/hello:hello",
    ],
    set_platforms = "//boards/x86:linux_x86",
)
