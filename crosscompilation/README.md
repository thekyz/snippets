# README

On Ubuntu 18.04 x86_64, with:
```
sudo apt-get update && sudo apt-get install -y\
    build-essential\
    gcc-avr\
    avr-libc\
    avrdude
```

and of course with Bazel installed ([see here](https://docs.bazel.build/versions/master/install.html)), run:

```
bazel build --config=avr //main:led
```

which will generate the `bazel-bin/main/led.hex` file to be flashed to the board.

To clean up:
```
bazel clean --expunge
```


## References

- [Introduction: hello world](https://docs.bazel.build/versions/master/tutorial/cpp.html)
- [Bazel user's guide](https://docs.bazel.build/versions/master/guide.html)
- [External dependencies](https://docs.bazel.build/versions/master/external.html)
- [Cross compiler toolchain configuration tutorial](https://docs.bazel.build/versions/master/tutorial/cc-toolchain-config.html)
- [Toolchain configuration parameters](https://docs.bazel.build/versions/master/skylark/lib/cc_common.html#create_cc_toolchain_config_info)
- [Hex file generation](https://github.com/mrenouf/bazel-avr-tools/blob/master/tools/avr/hex.bzl)

## Future improvements

- [Use platforms](https://docs.bazel.build/versions/master/platforms.html)
