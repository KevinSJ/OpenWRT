#!/bin/bash
#

PROFILE="linksys_wrt1200ac"
BASE_PACKAGES="-dnsmasq -odhcpd-ipv6only base-files bash block-mount busybox ca-bundle coremark curl \
-dnsmasq-full dropbear ds-lite e2fsprogs fstools htop iwinfo \
libc libgcc -libustream-openssl logd \
losetup swap-utils \
mwlwifi-firmware-88w8864 netifd odhcpd \
odhcp6c openssh-sftp-server opkg ppp ppp-mod-pppoe procd \
procd-seccomp resolveip swconfig uboot-envtools uci uclient-fetch urandom-seed \
urngd wget-ssl -wpad-basic-mbedtls wpad-openssl zram-swap aria2 mkf2fs \
vim-runtime vim-full unbound-control unbound-daemon knot-dig knot-libs tcpdump msmtp \
luci-proto-ipv6 luci-proto-ppp luci-proto-nebula nebula nebula-proto \
luci-theme-argon luci-theme-bootstrap luci-theme-openwrt luci-theme-openwrt-2020 luci-theme-material \
luci-app-firewall luci-app-opkg luci-base luci-compat luci-lib-ip luci-lib-jsonc luci-lib-ipkg mtd \
luci-app-adblock luci-app-advanced-reboot luci-app-uhttpd \
luci-app-banip luci-app-vnstat2 luci-app-unbound luci-app-nlbwmon \
luci-mod-dashboard luci-mod-network luci-mod-system luci-mod-status luci-mod-admin-full luci-app-wifischedule"

KMOD_PACKAGES="kmod-gpio-button-hotplug kmod-ipt-nat kmod-ipt-nat6  kmod-mwlwifi kmod-loop \
kmod-ppp kmod-pppoe kmod-tun kmod-usb-ohci kmod-usb-uhci kmod-fs-ext4"

# Add KMOD packages if KMOD_INCLUDED flag is set
TO_INSTALL="$BASE_PACKAGES $KMOD_PACKAGES"

make -j$(nproc) manifest PACKAGES="$TO_INSTALL" PROFILE=$PROFILE
make -j$(nproc) image PACKAGES="$TO_INSTALL" PROFILE=$PROFILE

