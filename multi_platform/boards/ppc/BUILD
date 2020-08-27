load("//transitions:defs.bzl", "my_pkg_tar")

platform(
    name = "linux_ppc",
    constraint_values = [
        "//os:linux",
        "//cpu:ppc",
    ],
)

my_pkg_tar(
    name = "ppc",
    srcs = [
        "//apps/hello:hello",
    ],
    set_platforms = "//boards/ppc:linux_ppc",
)
