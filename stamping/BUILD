cc_binary(
    name = "app",
    srcs = ["main.cc"],
    deps = [":stamp_lib"],
    stamp = True,
)

cc_library(
    name = "stamp_lib",
    hdrs = ["stamp_lib.h"],
    srcs = ["stamp_lib.cc"],
    linkstamp = "build_revision_linkstamp.cc",
)
