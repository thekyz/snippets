BAZEL?=~/dev/bazel/bazel-bin/src/bazel-dev

.PHONY: all
all: noshow show noshow_both noshow_loading

.PHONY: noshow_both
noshow_both:
	-$(BAZEL) test --noshow_progress --noshow_loading_progress --test_tag_filters=-nope --build_tag_filters=-nope //:hello

.PHONY: noshow_loading
noshow_loading:
	-$(BAZEL) test --noshow_loading_progress --test_tag_filters=-nope --build_tag_filters=-nope //:hello

.PHONY: noshow
noshow:
	-$(BAZEL) test --noshow_progress --test_tag_filters=-nope --build_tag_filters=-nope //:hello

.PHONY: show
show:
	-$(BAZEL) test --test_tag_filters=-nope --build_tag_filters=-nope //:hello
