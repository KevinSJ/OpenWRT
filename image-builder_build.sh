#!/bin/bash
#

PROFILE="linksys_wrt1200ac"
TO_INSTALL="-dnsmasq -odhcpd-ipv6only base-files bash block-mount busybox ca-bundle coremark curl \
dnsmasq-full dropbear ds-lite e2fsprogs fstools htop iwinfo \
kmod-gpio-button-hotplug kmod-ipt-nat kmod-ipt-nat6 kmod-lib-zstd kmod-mwlwifi \
kmod-tcp-bbr libc libgcc libustream-mbedtls logd \
mwlwifi-firmware-88w8864 netifd odhcpd \
odhcp6c openssh-sftp-server opkg ppp ppp-mod-pppoe procd \
procd-seccomp resolveip swconfig uboot-envtools uci uclient-fetch urandom-seed \
urngd wget-ssl -wpad-basic-mbedtls zram-swap aria2 mkf2fs \
mkf2fs kmod-ppp kmod-pppoe kmod-tun kmod-usb-ohci kmod-usb-uhci kmod-fs-btrfs kmod-fs-ext4 \
vim-runtime vim-full unbound-control unbound-daemon \
luci-proto-ipv6 luci-proto-ppp \
luci-theme-bootstrap luci-theme-openwrt luci-theme-openwrt-2020 luci-theme-material \
luci-app-firewall luci-app-opkg luci-base luci-compat luci-lib-ipkg mtd \
luci-app-adblock luci-app-advanced-reboot \
luci-app-banip luci-app-commands \
luci-app-ttyd luci-app-vnstat luci-app-unbound \
luci-app-uhttpd \
luci-mod-dashboard luci-mod-admin-full \
luci-app-hd-idle luci-app-ttyd luci-app-wifischedule \
luci-app-watchcat"

#luci-theme-edge luci-theme-design luci-theme-alpha luci-app-argon-config

make manifest PACKAGES="$TO_INSTALL" PROFILE=$PROFILE
make image PACKAGES="$TO_INSTALL" PROFILE=$PROFILE
