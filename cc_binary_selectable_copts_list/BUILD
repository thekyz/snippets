# This load statement replaces the native cc_binary (which has no "set_features"
# attribute) with a macro that strings together the logic to make that work,
# then passes everything else back to the native cc_binary.
load("//:defs.bzl", "library_transition_rule", "binary_transition_rule", "cc_library", "cc_binary")

cc_binary(
    name = "app1",
    srcs = ["main.cc"],
    set_features = ["feature3"],
    deps = [":app1-lib"],
)

cc_library(
    name = "app1-lib",
    deps = [":lib", ":ipa-import"],
)

cc_binary(
    name = "app2",
    srcs = ["main.cc"],
    set_features = ["feature3","feature4"],
    deps = [":app2-lib"]
)

cc_library(
    name = "app2-lib",
    deps = [":lib", ":ipa-import"],
)

# The library only builds if some feature is requested.
cc_library(
    name = "lib",
    srcs = ["lib.cc"],
    capabilities = ["feature1", "feature2"],
    copts = [] +
        select({"//custom_settings:feature1": ["-Dfeature1"], "//conditions:default": [] }) +
        select({"//custom_settings:feature2": ["-Dfeature2"], "//conditions:default": [] }) +
        [],
)

cc_binary(
    name = "libipa.so",
    deps = [":ipa-lib"],
    capabilities = ["feature2"],
    linkshared = True,
)

cc_library(
    name = "ipa-lib",
    deps = ["ipa-lib-cc"],
    alwayslink = True,
    capabilities = ["feature2"],
    copts = [] +
        select({"//custom_settings:feature2": ["-Dfeature2"], "//conditions:default": [] }) +
        [],
)

cc_library(
    name = "ipa-lib-cc",
    srcs = [
        "sublib.cc",
    ],
    alwayslink = True,
)

cc_import(
    name = "ipa-import",
    shared_library = ":libipa.so",
)
