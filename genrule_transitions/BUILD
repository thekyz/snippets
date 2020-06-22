load("//:defs.bzl", "binary_transition_rule", "cc_binary")
load("//:defs.bzl", "gen_transition_rule", "genrule")

cc_binary(
    name = "app1",
    srcs = ["main.cc", "gen_lib.cc"],
    set_features = ["feature1"],
)

cc_binary(
    name = "app2",
    srcs = ["main.cc", ":gen_lib"],
    set_features = ["feature2"],
)


genrule(
    name = "gen_lib",
    srcs = ["gen_lib_src.cc"],
    outs = ["gen_lib.cc"],
    cmd = "cp $< $@",
)
