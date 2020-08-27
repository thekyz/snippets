toolchain(
    name = "ppc_buildroot_toolchain",
    target_compatible_with = [
        "//os:linux",
        "//cpu:ppc",
    ],
    toolchain = ":cc_ppc_buildroot",
    toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
)

cc_toolchain(
    name = "cc_ppc_buildroot",
    toolchain_identifier = "ppc",
    toolchain_config = ":toolchain_config",
    all_files = ":all_files",
    compiler_files = ":compiler_files",
    linker_files = ":linker_files",
    strip_files = ":strip",
    ar_files = ":ar",
    as_files = ":as",
    objcopy_files = ":objcopy",
    dwp_files = ":empty",
    visibility = ["//visibility:public"],
)

load("//toolchains:cc_toolchain_config.bzl", "cc_toolchain_config")
cc_toolchain_config(
    name = "toolchain_config",
    cross_prefix = "powerpc-e6500-linux-gnu-",
    toolchain_path = "/home/tim/bazel_demos/platforms/toolchains/ppc",
)

filegroup(
    name = "all_files",
    srcs = [
        ":gcc",
        ":ar",
        ":ld",
        ":nm",
        ":objcopy",
        ":objdump",
        ":strip",
        ":as",
    ],
)

filegroup(
    name = "linker_files",
    srcs = [
        ":ar",
        ":gcc",
        ":ld",
    ],
)

filegroup(
    name = "compiler_files",
    srcs = [
        ":gcc",
    ],
)

filegroup(
    name = "empty",
    srcs = [],
)

filegroup(
    name = "gcc",
    srcs = [
    "host/bin/toolchain-wrapper",
    "host/bin/ccache",
    "host/opt/ext-toolchain/bin/powerpc-e6500-linux-gnu-gcc",
    "host/bin/powerpc-e6500-linux-gnu-gcc",
    ],
    visibility = ["//visibility:public"],
)
filegroup(
    name = "ar",
    srcs = [
    "host/opt/ext-toolchain/bin/powerpc-e6500-linux-gnu-ar",
    "host/bin/powerpc-e6500-linux-gnu-ar",
    ],
    visibility = ["//visibility:public"],
)
filegroup(
    name = "ld",
    srcs = [
    "host/opt/ext-toolchain/bin/powerpc-e6500-linux-gnu-ld",
    "host/bin/powerpc-e6500-linux-gnu-ld",
    ],
    visibility = ["//visibility:public"],
)
filegroup(
    name = "nm",
    srcs = [
    "host/opt/ext-toolchain/bin/powerpc-e6500-linux-gnu-nm",
    "host/bin/powerpc-e6500-linux-gnu-nm",
    ],
    visibility = ["//visibility:public"],
)
filegroup(
    name = "objcopy",
    srcs = [
    "host/opt/ext-toolchain/bin/powerpc-e6500-linux-gnu-objcopy",
    "host/bin/powerpc-e6500-linux-gnu-objcopy",
    ],
    visibility = ["//visibility:public"],
)
filegroup(
    name = "objdump",
    srcs = [
    "host/opt/ext-toolchain/bin/powerpc-e6500-linux-gnu-objdump",
    "host/bin/powerpc-e6500-linux-gnu-objdump",
    ],
    visibility = ["//visibility:public"],
)
filegroup(
    name = "strip",
    srcs = [
    "host/opt/ext-toolchain/bin/powerpc-e6500-linux-gnu-strip",
    "host/bin/powerpc-e6500-linux-gnu-strip",
    ],
    visibility = ["//visibility:public"],
)
filegroup(
    name = "as",
    srcs = [
    "host/opt/ext-toolchain/bin/powerpc-e6500-linux-gnu-as",
    "host/bin/powerpc-e6500-linux-gnu-as",
    ],
    visibility = ["//visibility:public"],
)

filegroup(
    name = "gengetopt",
    srcs = ["host/bin/gengetopt"],
    visibility = ["//visibility:public"],
)

filegroup(
    name = "pyang",
    srcs = ["host/bin/pyang"],
    visibility = ["//visibility:public"],
)

filegroup(
    name = "python",
    srcs = ["host/bin/python"],
    visibility = ["//visibility:public"],
)

filegroup(
    name = "confdc",
    srcs = ["host/confd/bin/confdc"],
    visibility = ["//visibility:public"],
)

filegroup(
    name = "confdc-deps",
    srcs = [
        "host/confd/lib",
    ],
    visibility = ["//visibility:public"],
)

filegroup(
    name = "protobuf_compiler",
    srcs = ["host/bin/protoc"],
    visibility = ["//visibility:public"],
)

proto_lang_toolchain(
    name = "cc_proto_toolchain",
    command_line = "--cpp_out=$(OUT)",
    visibility = ["//visibility:public"],
)

cc_import(
        name = "evtlog",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libevtlog.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "hiredis",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libhiredis.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "cgroup",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libcgroup.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "alchemy",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libalchemy.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "curl",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libcurl.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "xtables",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libxtables.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "asm-0.176",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libasm-0.176.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "dw-0.176",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libdw-0.176.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "fuse",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libfuse.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "form",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libform.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "e2p",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libe2p.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "lzma",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/liblzma.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "handle_protector",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libhandle_protector.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "dmalloc",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libdmalloc.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "dl",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libdl.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "thread_db",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libthread_db.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "archive",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libarchive.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "elf-0.176",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libelf-0.176.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "fdt-1.4.7",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libfdt-1.4.7.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "ulockmgr",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libulockmgr.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "pugixml",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libpugixml.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "event_core",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libevent_core.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "copperplate",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libcopperplate.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "dma_alloc",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libdma_alloc.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "execline",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libexecline.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "ltmon",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libltmon.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "unwind-ptrace",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libunwind-ptrace.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "ncurses",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libncurses.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "gthread-2.0",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libgthread-2.0.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "asm",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libasm.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "c",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libc.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "panel",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libpanel.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "nss_db",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libnss_db.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "ss",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libss.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "nss_hesiod",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libnss_hesiod.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "unwind",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libunwind.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "opkg",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libopkg.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "gio-2.0",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libgio-2.0.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "ext2fs",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libext2fs.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "unwind-ppc32",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libunwind-ppc32.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "jq",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libjq.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "crypt",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libcrypt.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "pthread",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libpthread.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "pcap",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libpcap.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "jansson",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libjansson.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "com_err",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libcom_err.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "psos",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libpsos.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "s6",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libs6.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "collectdclient",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libcollectdclient.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "curses",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libcurses.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "pcrecpp",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libpcrecpp.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "z",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libz.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "elf",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libelf.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "pcreposix",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libpcreposix.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "uio_generic",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libuio_generic.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "reborn-log",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libreborn-log.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "ffi",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libffi.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "tirpc",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libtirpc.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "nss_compat",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libnss_compat.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "s6rc",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libs6rc.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "zmq",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libzmq.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "util",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libutil.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "unwind-generic",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libunwind-generic.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "protobuf",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libprotobuf.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "m",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libm.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "resolv",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libresolv.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "rt",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/librt.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "dmallocxx",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libdmallocxx.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "vxworks",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libvxworks.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "anl",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libanl.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "event_openssl",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libevent_openssl.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "event_pthreads",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libevent_pthreads.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "menu",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libmenu.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "uuid",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libuuid.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "protoc",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libprotoc.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "opentracing",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libopentracing.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "iptc",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libiptc.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "crypto",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libcrypto.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "telnet",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libtelnet.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "skarnet",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libskarnet.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "popt",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libpopt.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "ip4tc",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libip4tc.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "ip6tc",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libip6tc.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "opentracing_mocktracer",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libopentracing_mocktracer.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "gobject-2.0",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libgobject-2.0.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "fdt",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libfdt.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "smokey",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libsmokey.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "pcre",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libpcre.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "uio",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libuio.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "gmodule-2.0",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libgmodule-2.0.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "dmallocth",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libdmallocth.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "i2c",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libi2c.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "shared-lock",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libshared-lock.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "blkid",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libblkid.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "nss_files",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libnss_files.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "mercury",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libmercury.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "ssl",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libssl.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "app-config",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libapp-config.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "unwind-setjmp",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libunwind-setjmp.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "jsonopentracer",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libjsonopentracer.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "BrokenLocale",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libBrokenLocale.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "protobuf-lite",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libprotobuf-lite.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "sqlite3",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libsqlite3.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "nss_dns",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libnss_dns.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "dmallocthcxx",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libdmallocthcxx.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "app-config-parser",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libapp-config-parser.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "glib-2.0",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libglib-2.0.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "dw",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/usr/lib/libdw.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "confd",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/lib/libconfd.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "nss_db-2.29",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/lib/libnss_db-2.29.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "thread_db-1.0",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/lib/libthread_db-1.0.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "atomic",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/lib/libatomic.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "stdc++",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/lib/libstdc++.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "pcprofile",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/lib/libpcprofile.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "crypt-2.29",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/lib/libcrypt-2.29.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "pthread-2.29",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/lib/libpthread-2.29.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "memusage",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/lib/libmemusage.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "anl-2.29",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/lib/libanl-2.29.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "rt-2.29",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/lib/librt-2.29.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "gcc_s",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/lib/libgcc_s.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "SegFault",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/lib/libSegFault.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "nss_compat-2.29",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/lib/libnss_compat-2.29.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "nsl-2.29",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/lib/libnsl-2.29.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "c-2.29",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/lib/libc-2.29.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "itm",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/lib/libitm.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "dl-2.29",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/lib/libdl-2.29.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "nss_hesiod-2.29",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/lib/libnss_hesiod-2.29.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "m-2.29",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/lib/libm-2.29.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "nss_files-2.29",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/lib/libnss_files-2.29.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "util-2.29",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/lib/libutil-2.29.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "resolv-2.29",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/lib/libresolv-2.29.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "nss_dns-2.29",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/lib/libnss_dns-2.29.so",
        visibility = ["//visibility:public"],
)
cc_import(
        name = "BrokenLocale-2.29",
        hdrs = glob(["staging/usr/include/**/*.h"]),
        shared_library = "staging/lib/libBrokenLocale-2.29.so",
        visibility = ["//visibility:public"],
)

