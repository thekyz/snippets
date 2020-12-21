load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def download_toolchains():
    http_archive(
        name = "gcc-arm-x86_64-aarch64_be-linux-gnu",
        build_file = Label("//toolchains:gcc-arm-x86_64-aarch64_be-linux-gnu.BUILD"),
        url = "https://developer.arm.com/-/media/Files/downloads/gnu-a/8.2-2018.08/gcc-arm-8.2-2018.08-x86_64-aarch64_be-linux-gnu.tar.xz?revision=0a2745e3-9208-40d9-9e5b-f354f93a8090&la=en&hash=E42FBFB48D0751F03C71B29ADBE94A6CC0443B44",
        sha256 = "2cd8a1a35a892db5f0cd738a8b17bd1563f6d6e4be43a2b527b355bcfb295df8",
        strip_prefix = "gcc-arm-8.2-2018.08-x86_64-aarch64_be-linux-gnu",
    )
    http_archive(
        name = "sysroot-glibc-x86_64-aarch64_be-linux-gnu",
        build_file = Label("//toolchains:sysroot-glibc-x86_64-aarch64_be-linux-gnu.BUILD"),
        url = "https://developer.arm.com/-/media/Files/downloads/gnu-a/8.2-2018.08/sysroot-glibc-8.2-2018.08-x86_64-aarch64_be-linux-gnu.tar.xz?revision=c93e9840-1498-4712-8798-52b81d191aac&ln=en&hash=DA7F161631BD7679526110F3E2AA9B728F7E83E0",
        sha256 = "cfa3894163cab1cc6b7572146175ccf79497a814fc1632898f18e5e87eeb88eb",
    )
