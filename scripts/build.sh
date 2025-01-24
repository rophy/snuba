#!/bin/bash
set -eu

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $SCRIPT_DIR/..

docker buildx build \
    "${args[@]}" \
    --build-arg BUILDKIT_INLINE_CACHE=1 \
    --build-arg SHOULD_BUILD_ADMIN_UI=true \
    --build-arg SHOULD_BUILD_RUST=false \
    --platform linux/amd64 \
    --tag snuba \
    --target application \
    .
