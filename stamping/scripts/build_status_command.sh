#!/bin/bash

# If the script exits with non-zero code, it's considered as a failure
# and the output will be discarded.

# The code below presents an implementation that works for git repository
git_rev=$(git rev-parse HEAD)
if [[ $? != 0 ]];
then
    exit 1
fi
echo "BUILD_SCM_REVISION ${git_rev}"

# Check whether there are any uncommitted changes
git diff-index --quiet HEAD --
if [[ $? == 0 ]];
then
    tree_status="Clean"
else
    tree_status="Modified"
fi
echo "BUILD_SCM_STATUS ${tree_status}"

echo "BUILD_CUSTOM_ID_V $(date +%s)"
echo "BUILD_CUSTOM_ID_F 0xdeadbeef"
