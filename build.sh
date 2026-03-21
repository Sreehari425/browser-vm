#!/usr/bin/env bash

docker build -t buildroot .

mkdir -p dist/ccache dist/dl
docker rm -f build-v86 2>/dev/null || true
docker run \
    --rm \
    --name build-v86 \
    -v $PWD/dist:/build \
    -v $PWD/dist/ccache:/root/.buildroot-ccache \
    -v $PWD/dist/dl:/root/buildroot-2021.02-rc2/dl \
    -v $PWD/buildroot-v86/:/buildroot-v86 \
    buildroot

echo "See ./dist for built ISO"
