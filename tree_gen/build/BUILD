exports_files([
    "templates/BUILD.template",
    "gen_build_files.py",
])

filegroup(
    name = "build",
    srcs = [
        "//app1:gen_build",
        "//app2:gen_build",
        # libs
        "//liba:gen_build",
        "//libb:gen_build",
        "//libc:gen_build",
        "//libd:gen_build",
        "//libe:gen_build",
    ],
)
