load("//:defs.bzl", "build_manifest")

build_manifest(
    name = "manifest",
    template = "build_info.h.tmpl",
)

py_binary(
    name = "gen_build_info",
    srcs = [
        "gen_build_info.py",
    ],
)

cc_binary(
    name = "app",
    srcs = [
        "main.cc",
        ":manifest",
    ],
    deps = [
        "//linkstamp:stamp_lib",
    ],
    stamp = True,
)
