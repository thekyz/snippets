all: app1 app2

.PHONY: app1
app1: gen
	@echo ">>> building $@ ..."
	bazel run //$@

.PHONY: app2
app2: gen
	@echo ">>> building $@ ..."
	bazel run //$@

.PHONY: gen
gen:
	build/gen_build_files.sh
