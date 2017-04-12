#!/bin/bash

# Copyright (c) Microsoft. All rights reserved.
# Licensed under the MIT license. See LICENSE file
# in the project root for full license information.

set -e

build_root=$(cd "$(dirname "$0")/.." && pwd)
build_root=$build_root/build_libuv

# clear the libuv build folder so we have a fresh build
rm -rf $build_root
mkdir -p $build_root

# build libuv
pushd $build_root
git clone https://github.com/libuv/libuv.git
cd libuv
git checkout -b v1.11.0 tags/v1.11.0
sh autogen.sh
./configure --prefix=$build_root/dist/
make -j $(nproc)
make install
popd
