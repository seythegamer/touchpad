#!/bin/sh

CONFIG_FILE=$(echo /etc/gesture/??-touchpad-cmt.conf)
test -f $CONFIG_FILE || CONFIG_FILE="/etc/gesture/40-touchpad-cmt.conf"
fi

echo "Mounting the rootfs as read-write..."
mount -o remount,rw /

echo "Downloading the configuration file for your touchpad..."
curl $CONFIG_FILE https://raw.github.com/zhaostu/chromium-os-touchpad/master/alps.xorg.conf

echo "Configuration finished. Please type 'restart ui' or reboot to make the change effective."
