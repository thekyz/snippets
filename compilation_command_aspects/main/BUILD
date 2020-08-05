load("//:hello_aspect.bzl", "hello_base_rule")

cc_library(
    name = "main",
    srcs = [
        "main.c"
    ],
    deps = [
        "//lib:export",
        "//main/submain",
    ],
    visibility = ["//visibility:public"],
)

hello_base_rule(
    name = "hello_for_main",
    library = ":main",
    deps = [
        "//main/submain:hello_for_submain"
    ],
    visibility = ["//visibility:public"],
)
