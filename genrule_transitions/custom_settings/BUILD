load(":flags.bzl", "string_list_flag")

string_list_flag(
    name = "mycopts",
    build_setting_default = ["unset"],
)

config_setting(
    name = "feature1",
    flag_values = {":mycopts": "feature1"},
)

config_setting(
    name = "feature2",
    flag_values = {":mycopts": "feature2"},
)
