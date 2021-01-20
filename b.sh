#!/bin/sh

CONFIG_FILE=$(echo /etc/gestures/xorg.conf.d/??-touchpad-cmt.conf)
test -f $CONFIG_FILE || CONFIG_FILE="/etc/gestures/xorg.conf.d/40-touchpad-cmt.conf"

set -e

echo "Mounting the rootfs as read-write..."
mount -o remount,rw /

echo "Downloading the configuration file for your touchpad..."
curl $CONFIG_FILE https://raw.github.com/zhaostu/chromium-os-touchpad/master/alps.xorg.conf | sh

echo "Configuration finished. Please type 'restart ui' or reboot to make the change effective."
