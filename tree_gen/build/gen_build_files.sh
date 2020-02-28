#!/bin/bash

#ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/../"

set -euo pipefail

git update-index --assume-unchanged lib*/BUILD app*/BUILD

echo ">>> generating BUILD files ..."
bazel build //build

echo ">>> unsandboxing ..."
for f in bazel-bin/**/BUILD.gen; do
    _basedir=$(dirname "${f}")
    _basename=${_basedir#bazel-bin/}/BUILD
    cp -vf "${f}" "${_basename}"
done
