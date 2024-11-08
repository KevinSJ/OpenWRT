#!/bin/bash
#

PROFILE="linksys_wrt1200ac"
BASE_PACKAGES="-dnsmasq -odhcpd-ipv6only base-files bash block-mount busybox ca-bundle coremark curl \
dnsmasq-full dropbear ds-lite e2fsprogs fstools htop iwinfo \
libc libgcc libustream-openssl logd \
losetup swap-utils \
mwlwifi-firmware-88w8864 netifd odhcpd \
odhcp6c openssh-sftp-server opkg ppp ppp-mod-pppoe procd \
procd-seccomp resolveip swconfig uboot-envtools uci uclient-fetch urandom-seed \
urngd wget-ssl -wpad-basic-mbedtls zram-swap aria2 mkf2fs \
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

KMOD_PACKAGES="kmod-gpio-button-hotplug kmod-ipt-nat kmod-ipt-nat6  kmod-mwlwifi kmod-loop \
kmod-ppp kmod-pppoe kmod-tun kmod-usb-ohci kmod-usb-uhci kmod-fs-ext4"

# Add KMOD packages if KMOD_INCLUDED flag is set
if [ "$KMOD_INCLUDED" = "1" ]; then
    TO_INSTALL="$BASE_PACKAGES $KMOD_PACKAGES"
else
    TO_INSTALL="$BASE_PACKAGES"
fi

make manifest PACKAGES="$TO_INSTALL" PROFILE=$PROFILE
make image PACKAGES="$TO_INSTALL" PROFILE=$PROFILE

