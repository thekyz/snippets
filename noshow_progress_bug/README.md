showcases a bug with `--noshow_progress` and test filters:

```
~ make                                                                                                                                                                                                        ─╯
bazel test --noshow_progress --test_tag_filters=-nope --build_tag_filters=-nope //:hello
INFO: Analyzed 0 targets (0 packages loaded, 0 targets configured).
INFO: Found 0 test targets...
INFO: Elapsed time: 0.042s, Critical Path: 0.00s
INFO: 1 process: 1 internal.
ERROR: No test targets were found, yet testing was requested
make: [Makefile:6: noshow] Error 4 (ignored)
bazel test --show_progress --test_tag_filters=-nope --build_tag_filters=-nope //:hello
INFO: Analyzed 0 targets (0 packages loaded, 0 targets configured).
INFO: Found 0 test targets...
INFO: Elapsed time: 0.045s, Critical Path: 0.00s
INFO: 1 process: 1 internal.
INFO: Build completed successfully, 1 total action
INFO: Build completed successfully, 1 total action
make: [Makefile:10: show] Error 4 (ignored)
```
