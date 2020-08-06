load("//:hello_aspect.bzl", "hello_base_rule")

cc_library(
    name = "submain",
    srcs = [
        "submain.c",
    ],
    deps = [
        ":export",
    ],
    visibility = ["//visibility:public"],
)

cc_library(
    name = "export",
    hdrs = [
        "export/submain.h",
    ],
    strip_include_prefix = "export",
    include_prefix = "submain",
    visibility = ["//visibility:public"],
)
