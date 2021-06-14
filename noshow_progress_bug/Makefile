.PHONY: all
all: noshow show

.PHONY: noshow
noshow:
	-bazel test --noshow_progress --test_tag_filters=-nope --build_tag_filters=-nope //:hello

.PHONY: show
show:
	-bazel test --show_progress --test_tag_filters=-nope --build_tag_filters=-nope //:hello
