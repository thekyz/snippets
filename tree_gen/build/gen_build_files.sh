#!/bin/bash

ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/../"

set -euo pipefail

echo ">>> generating BUILD files ..."
bazel build //build

echo ">>> unsandboxing ..."
cp -rvf bazel-bin/build/* "${ROOT}"
