workspace(name = "bazel-nix-python-example")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

######################
# Nix
######################
http_archive(
    name = "io_tweag_rules_nixpkgs",
    sha256 = "7aee35c95251c1751e765f7da09c3bb096d41e6d6dca3c72544781a5573be4aa",
    strip_prefix = "rules_nixpkgs-0.8.0",
    urls = ["https://github.com/tweag/rules_nixpkgs/archive/v0.8.0.tar.gz"],
)

load("@io_tweag_rules_nixpkgs//nixpkgs:repositories.bzl", "rules_nixpkgs_dependencies")

rules_nixpkgs_dependencies()

load("@io_tweag_rules_nixpkgs//nixpkgs:nixpkgs.bzl", "nixpkgs_git_repository", "nixpkgs_package")

nixpkgs_git_repository(
    name = "nixpkgs",
    revision = "21.05",  # Any tag or commit hash
    sha256 = "",  # optional sha to verify package integrity!
)

######################
# C Support
######################
load("@io_tweag_rules_nixpkgs//nixpkgs:nixpkgs.bzl", "nixpkgs_cc_configure")

nixpkgs_cc_configure(repository = "@nixpkgs//:default.nix")

######################
# Python Support
######################
nixpkgs_package(
    name = "python39",
    nix_file = "//:python39.nix",
    repository = "@nixpkgs//:default.nix",
)

rules_python_version = "f1b6b742254ec11f9e7bd6bff19ad2b327107a45" # Latest @ 2021-06-15

http_archive(
    name = "rules_python",
    strip_prefix = "rules_python-{}".format(rules_python_version),
    sha256 = "e7e59592d5303870bd517a962882e5b3cfbaea10c03f1ef14f7e3715c217e94c",
    url = "https://github.com/bazelbuild/rules_python/archive/{}.zip".format(rules_python_version),
)

load("@rules_python//python:pip.bzl", "pip_parse")

pip_parse(
    name = "py_deps",
    python_interpreter_target = "@python39//:bin/python",
    requirements_lock = "//:requirements.txt",
    extra_pip_args = ["--no-cache-dir"],
)

load("@py_deps//:requirements.bzl", "install_deps")
install_deps()

register_toolchains("//:py_3_toolchain")

