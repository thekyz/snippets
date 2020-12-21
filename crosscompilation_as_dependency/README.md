# instructions

This showcases cross-compiling with bazel with an external toolchain and sysroot.

Build with:

```
bazel build --crosstool_top=//toolchains/gcc-arm-x86_64-aarch64_be-linux-gnu:toolchain_suite --cpu=aarch64 //apps/hello
```

# known issues

Current toolchain has link issues due to abs path in linker scripts.
