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

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
echo 'src-git argontheme https://github.com/jerrykuku/luci-theme-argon.git' >>feeds.conf.default
#echo 'src-git immortalwrt https://github.com/immortalwrt/packages' >>feeds.conf.default

# Use last stable release that's not rc
git checkout $(git tag -l|grep -v 'rc'|tail -1)
# Apply patches
git am $GITHUB_WORKSPACE/$PATCH_DIR/*.patch --3way
