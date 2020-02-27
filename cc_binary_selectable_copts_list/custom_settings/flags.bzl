BuildSettingInfo = provider(
    doc = "A singleton provider that contains the raw value of a build setting",
    fields = {
        "value": "The value of the build setting in the current configuration. " +
                 "This value may come from the command line or an upstream transition, " +
                 "or else it will be the build setting's default.",
    },
)

def _impl(ctx):
    return BuildSettingInfo(value = ctx.build_setting_value)

string_list_flag = rule(
    implementation = _impl,
    build_setting = config.string_list(flag = True),
    doc = "A string list-typed build setting that can be set on the command line",
)
