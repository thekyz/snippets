# Buildbarn

### Server set-up

```
git clone https://github.com/buildbarn/bb-deployments.git
cd bb-deployments/docker-compose
./run.sh
```

If during startup you encounter the following error:
```
worker-ubuntu16-04_1  | 2020/03/24 09:28:50 rpc error: code = Unavailable desc = Failed to synchronize with scheduler: all SubConns are in TransientFailure, latest connection error: connection error: desc = "transport: Error while dialing dial tcp 172.18.0.7:8983: connect: connection refused"
```
you can ignore it, as it simply occurs due to the worker starting faster than the scheduler.

When everything has succesfully started, the buildbarn is up and running.

The interactive buildbarn browser can be found at http://localhost:7984/.

### Client set-up

>  **Make sure to use Bazel version 1.2.1**

On the client side, some configuration needs to be done in order to build remotely.

Add RBE rules to WORKSPACE file:
```
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "bazel_toolchains",
    sha256 = "04b10647f76983c9fb4cc8d6eb763ec90107882818a9c6bef70bdadb0fdf8df9",
    strip_prefix = "bazel-toolchains-1.2.4",
    urls = [
        "https://github.com/bazelbuild/bazel-toolchains/releases/download/1.2.4/bazel-toolchains-1.2.4.tar.gz",
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-toolchains/archive/1.2.4.tar.gz",
    ],
)

load("@bazel_toolchains//rules:rbe_repo.bzl", "rbe_autoconfig")

rbe_autoconfig(name = "rbe_default")
```

Add to .bazelrc file:
```
# From https://github.com/bazelbuild/bazel-toolchains/blob/master/bazelrc/bazel-1.0.0.bazelrc
build:rbe-ubuntu16-04 --action_env=BAZEL_DO_NOT_DETECT_CPP_TOOLCHAIN=1
build:rbe-ubuntu16-04 --crosstool_top=@rbe_default//cc:toolchain
build:rbe-ubuntu16-04 --extra_execution_platforms=@rbe_default//config:platform
build:rbe-ubuntu16-04 --extra_toolchains=@rbe_default//config:cc-toolchain
build:rbe-ubuntu16-04 --host_java_toolchain=@bazel_tools//tools/jdk:toolchain_hostjdk8
build:rbe-ubuntu16-04 --host_javabase=@rbe_default//java:jdk
build:rbe-ubuntu16-04 --host_platform=@rbe_default//config:platform
build:rbe-ubuntu16-04 --java_toolchain=@bazel_tools//tools/jdk:toolchain_hostjdk8
build:rbe-ubuntu16-04 --javabase=@rbe_default//java:jdk
build:rbe-ubuntu16-04 --platforms=@rbe_default//config:platform

# Additional settings.
build:rbe-ubuntu16-04 --action_env=PATH=/bin:/usr/bin
build:rbe-ubuntu16-04 --cpu=k8
build:rbe-ubuntu16-04 --host_cpu=k8

# Environment
# build:mycluster --bes_backend=grpc://localhost:8985
# build:mycluster --bes_results_url=http://localhost:7984/build_events/bb-event-service/
build:mycluster --remote_executor=grpc://localhost:8980
build:mycluster --remote_instance_name=remote-execution

build:mycluster-ubuntu16-04 --config=mycluster
build:mycluster-ubuntu16-04 --config=rbe-ubuntu16-04
build:mycluster-ubuntu16-04 --jobs=64
```

>  Note: the build event service (bes) will be removed in future releases
   (https://github.com/buildbarn/bb-browser/issues/21), as such, the client options
   regarding it are commented out.

Then the client can build remotely using:
```
bazel build --config=mycluster-ubuntu16-04 //main-package:main-rule
```
