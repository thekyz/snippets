load("@dbx_build_tools//build_tools/py:py.bzl",
     "dbx_py_library",
     "dbx_py_binary",
     "dbx_py_test",
     "dbx_py_pytest_test",
)

dbx_py_library(
    name = "hello_lib",
    srcs = [
        "hello.py",
    ],
    deps = [
        "//3rdparty/python/pip/pyyaml",
    ],
)

dbx_py_binary(
    name = "hello",
    main = "main.py",
    srcs = [
        "main.py",
    ],
    deps = [
        ":hello_lib",
    ],
)

dbx_py_pytest_test(
    name = "unit_pytest",
    python2_compatible = False,
    srcs = [
        "hello_test.py",
    ],
    deps = [
        ":hello_lib",
    ],
)
