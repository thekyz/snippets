load('//:hello_aspect.bzl', 'hello_gather_rule')

cc_binary(
    name = "app",
    deps = [
        "//main",
        "//lib",
    ],
)

hello_gather_rule(
    name = "hello_for_app",
    deps = [
        "//main:hello_for_main",
        "//lib:hello_for_lib",
    ],
)
