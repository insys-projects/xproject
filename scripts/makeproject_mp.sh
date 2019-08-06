#!/bin/bash

CPUTYPE="zynqMP"
PRJ=project
FPGABIN=system.bit

#
# petalinux configuration step
#

petalinux-create --type project --template ${CPUTYPE} --name ${PRJ}

cd ${PRJ}

petalinux-config --get-hw-description ../

cp -fvr ../system-user.dtsi ./project-spec/meta-user/recipes-bsp/device-tree/files/

petalinux-config -c rootfs
petalinux-config -c kernel
petalinux-build

exit 0
