genrule(
    name = "gen_build",
    srcs = [
        "//build:templates/BUILD.template",
        "lib.json",
    ],
    tools = [
        "//build:gen_build_files.py",
    ],
    outs = [
        "BUILD",
    ],
    cmd = """
        python3 $(location //build:gen_build_files.py) $(location //build:templates/BUILD.template) $(location lib.json) $@
    """,
)
