#!/bin/sh

CONFIG_FILE=$(echo /etc/gestures/xorg.conf.d/??-touchpad-cmt.conf)
test -f $CONFIG_FILE || CONFIG_FILE="/etc/gestures/xorg.conf.d/40-touchpad-cmt.conf"

# Check which type of touchpad is present.
if grep -qi alps /proc/bus/input/devices;
  echo "ALPS touchpad detected."
  TOUCHPAD="alps"
else
  echo "No known touchpad found, exiting."
  exit
fi

set -e

echo "Mounting the rootfs as read-write..."
mount -o remount,rw /

if [ ! -e "$CONFIG_FILE.bak" ]; then
  echo "Creating backup for $CONFIG_FILE..."
  cp $CONFIG_FILE $CONFIG_FILE.bak
fi

echo "Downloading the configuration file for your touchpad..."
curl $CONFIG_FILE https://raw.github.com/zhaostu/chromium-os-touchpad/master/alps.xorg.conf | sh

echo "Configuration finished. Please type 'restart ui' or reboot to make the change effective."
