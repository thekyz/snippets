load("//:hello_aspect.bzl", "hello_base_rule")

cc_library(
    name = "lib",
    srcs = [
        "lib.c",
        "helper.c",
    ],
    deps = [
        ":headers",
        ":export",
    ],
    visibility = ["//visibility:public"],
)

genrule(
    name = "gen_helper",
    tools = [
        "gen_helper.sh",
    ],
    outs = [
        "helper.c",
    ],
    cmd = "$(location gen_helper.sh) $@",
)

hello_base_rule(
    name = "hello_for_lib",
    library = ":lib",
    visibility = ["//visibility:public"],
)

cc_library(
    name = "headers",
    hdrs = [
        "include/helper.h",
    ],
    strip_include_prefix = "include",
)

cc_library(
    name = "export",
    hdrs = [
        "export/lib.h",
    ],
    strip_include_prefix = "export",
    include_prefix = "lib",
    visibility = ["//visibility:public"],
)
