#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# 20230710: Using latest tag, could be rc
version_tag="$(git tag -l|grep -v 'rc'|tail -1)"
git checkout "$version_tag"
#
# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
echo 'src-git argontheme https://github.com/jerrykuku/luci-theme-argon.git' >> feeds.conf.default
#echo 'src-git immortalwrt https://github.com/immortalwrt/packages' >>feeds.conf.default
wget https://downloads.openwrt.org/releases/"$version_tag|tr -d 'v'"/targets/mvebu/cortexa9/llvm-bpf-15.0.7.Linux-x86_64.tar.xz
tar -xvaf llvm-bpf-15.0.7.Linux-x86_64.tar.xz

rm $GITHUB_WORKSPACE/$PATCH_DIR/0010-Add-divblock-an-extremely-simple-ad-blocker.patch

# Apply patches
git am $GITHUB_WORKSPACE/$PATCH_DIR/*.patch --3way
