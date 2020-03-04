# This load statement replaces the native cc_binary (which has no "set_features"
# attribute) with a macro that strings together the logic to make that work,
# then passes everything else back to the native cc_binary.
load("//:defs.bzl", "library_transition_rule", "binary_transition_rule", "import_transition_rule", "cc_library", "cc_binary", "cc_import")

# To see what this does, try "$ bazel run //:app_with_feature1".
cc_binary(
    name = "app_with_feature1",
    srcs = ["main.cc"],
    set_features = ["feature1"],
    deps = [":lib"],
)

# To see what this does, try "$ bazel run //:app_with_feature2".
cc_binary(
    name = "app_with_feature2",
    srcs = ["main.cc"],
    set_features = ["feature2"],
    deps = [":lib"],
)

cc_binary(
    name = "app_with_feature3",
    srcs = ["main.cc"],
    set_features = ["feature3"],
    deps = [":lib"],
)

cc_binary(
    name = "app_no_feat",
    srcs = ["main.cc"],
    deps = [":lib"],
)

# To see what this does, try "$ bazel run //:app_with_feature1and2".
cc_binary(
    name = "app_with_feature1and2",
    srcs = ["main.cc"],
    set_features = ["feature1", "feature2"],
    deps = [":lib"],
)

# The library only builds if some feature is requested.
cc_library(
    name = "lib",
    srcs = ["lib.cc"],
    capabilities = ["feature1", "feature2"],
    deps = ["//import:protobuf"],
    copts = [] +
        select({"//custom_settings:feature1": ["-Dfeature1"], "//conditions:default": [] }) +
        select({"//custom_settings:feature2": ["-Dfeature2"], "//conditions:default": [] }) +
        [],
)
