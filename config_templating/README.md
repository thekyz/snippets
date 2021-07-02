example configuration setting from BUILD file

run:


```
~ bazel build //:main_config

# then:

~ cat bazel-bin/main_config.h

// THIS IS A GENERATED FILE, SOURCE DATA COMES FROM //:BUILD

#pragma once

#define CONFIG_SITE "Antwerp"
```
