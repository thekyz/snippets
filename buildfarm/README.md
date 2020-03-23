# Buildfarm on Ubuntu 18.04 x86_64

Make sure jdk is installed:
```
sudo apt install default-jdk
```

Clone and enter git repo:
```
git clone https://github.com/bazelbuild/bazel-buildfarm.git
cd bazel-buildfarm
```

Run the server:
```
bazel run --java_toolchain=@bazel_tools//tools/jdk:toolchain_java11 //src/main/java/build/buildfarm:buildfarm-server /absolute/path/to/server.config
```

Run worker:
```
bazel run //src/main/java/build/buildfarm:buildfarm-operationqueue-worker /absolute/path/to/worker.config
```


Execute remotely from client by adding following line to .bazelrc:
```
build --remote_executor=grpc://localhost:8980
```

Or use ngrok `nrok tcp 8980` on host to enable remote access and add this line instead:
```
build --remote_executor=grpc://0.tcp.ngrok.io:&lt;ngrok-port&gt;
```

## Debug

If the following error is encountered:
```
Exception in thread "main" java.lang.IllegalArgumentException: external/local_jdk
```
Try setting the JAVA_HOME environment variable:
```
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
```
