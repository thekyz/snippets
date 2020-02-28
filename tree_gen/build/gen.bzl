def gen_build(deps=[], **kwargs):
    native.genrule(
        name = "gen_build",
        srcs = deps + [
            "//build:templates/BUILD.template",
            "lib.json",
        ],
        tools = [
            "//build:gen_build_files.py",
        ],
        outs = [
            "BUILD.gen",
        ],
        cmd = """
            python3 $(location //build:gen_build_files.py) $(location //build:templates/BUILD.template) $(location lib.json) $@
        """,
        visibility = ["//visibility:public"],
        **kwargs
    )
