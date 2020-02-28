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

    # shellcheck disable=SC2015
    rsync -ci -h "${f}" "${_basename}" | grep '>' > /dev/null && echo "  -> ${_basename}" || true
done
