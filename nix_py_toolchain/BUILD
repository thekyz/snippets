package(default_visibility = ["//visibility:public"])

load("@rules_python//python:defs.bzl", "py_runtime", "py_runtime_pair")
load("@rules_python//python/pip_install:requirements.bzl", "compile_pip_requirements")

compile_pip_requirements(
  name = "requirements",
  extra_args = ["--allow-unsafe"],
)


# Python toolchain
py_runtime(
    name = "python3_runtime",
    interpreter = "@python39//:bin/python",
    python_version = "PY3",
)

py_runtime_pair(
    name = "py_runtime_pair",
    py2_runtime = None,
    py3_runtime = ":python3_runtime",
)

toolchain(
    name = "py_3_toolchain",
    toolchain = ":py_runtime_pair",
    toolchain_type = "@bazel_tools//tools/python:toolchain_type",
)
