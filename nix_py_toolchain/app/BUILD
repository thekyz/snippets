load("@rules_python//python:defs.bzl", "py_library", "py_test")
load("@py_deps//:requirements.bzl", "requirement")

package(default_visibility = ["//visibility:public"])

py_test(
    name = "test_pandas",
    srcs = ["test_pandas.py"],
    deps = [
        requirement("pytest"),
        requirement("pandas"),
    ],
)
