#!/bin/bash

if [[ ${PETALINUX_VER} = "" ]]
then
    echo "PETALINUX environment not set! Please, do: source /opt/xilinx/petalinux/settings.sh"
    return -1;
fi

PWD=`pwd`
HDF_ROOT=$1
PRJ_ROOT=${PWD}/${HDF_ROOT}

if [ ! -d ${PRJ_ROOT} ];
then
    echo "Project directory does not exist: ${PRJ_RROT}"
    return -1;
fi

cd ${PRJ_ROOT}

CPUTYPE="zynq"
PRJ=project

echo ====================================================
echo Create petalinux project template
echo ====================================================

petalinux-create --type project --template ${CPUTYPE} --name ${PRJ}

cd ${PRJ}

echo ====================================================
echo Configure hardware description
echo ====================================================

petalinux-config --get-hw-description ../

echo ====================================================
echo Extract custom device tree and u-boot files
echo ====================================================

tar -xzvf ../../common/recipes-bsp-fmc130e.tgz -C ./project-spec/meta-user/

echo ====================================================
echo Configure root filesystem packages
echo ====================================================
petalinux-config -c rootfs

echo ====================================================
echo Configure linux kernel options
echo ====================================================
petalinux-config -c kernel

echo ====================================================
echo Start building project
echo ====================================================
petalinux-build

exit 0
