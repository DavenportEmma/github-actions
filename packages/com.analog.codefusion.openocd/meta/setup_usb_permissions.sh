#!/bin/bash
# Copyright (c) 2015-2024 Analog Devices, Inc. All Rights Reserved.

if [[ "$UID" != 0 || -z "$SUDO_USER" ]]; then
    echo "You must run this script with sudo:"
    echo "sudo $0 $*"
    exit 0
fi

rules=/etc/udev/rules.d/cfs.rules
group=cfsusb

echo "Creating '"$rules"' ..."
cat >$rules <<EOF
ATTRS{idVendor}=="064b", GROUP="$group"
ATTRS{idVendor}=="1366", GROUP="$group"
ATTRS{idVendor}=="0d28", ATTRS{idProduct}=="0204", GROUP="$group"
ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="6124", GROUP="$group"
EOF
echo "Done."

echo "Adding user '"$SUDO_USER"' to group '"$group"' ..."
if [ -z $(getent group $group) ]; then
    addgroup $group
fi
usermod -a -G $group $SUDO_USER
echo "Done."

echo "Reloading udev rules ..."
udevadm control --reload && udevadm trigger
echo "Done."

cat <<EOF
========================================================================
You may need to restart your computer for these settings to take effect.

If you wish to remove USB device permissions for CFS:
sudo groupdel $group
sudo rm $rules
========================================================================
EOF
