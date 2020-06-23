genrule(
    name = "gen_build_info",
    outs = ["build_info.h"],
    cmd = "echo \"#define BUILD_TIME $$(date +%s)\" > $@",
)

cc_binary(
    name = "app",
    srcs = ["main.cc", ":gen_build_info"],
)

