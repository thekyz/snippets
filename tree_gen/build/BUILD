genrule(
    name = "build",
    srcs = [
        # apps
        "//app1:lib.json",
        "//app2:lib.json",
        # libs
        "//liba:lib.json",
        "//libb:lib.json",
        "//libc:lib.json",
        "//libd:lib.json",
        "//libe:lib.json",
    ],
    outs = [
        "app1/BUILD",
        "app2/BUILD",

        "liba/BUILD",
        "libb/BUILD",
        "libc/BUILD",
        "libd/BUILD",
        "libe/BUILD",
    ],
    cmd = """
        touch $(OUTS)
    """,
)
