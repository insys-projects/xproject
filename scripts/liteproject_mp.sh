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

CPUTYPE="zynqMP"
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

#tar -xzvf ../../common/recipes-bsp-fmc133v-v10.tgz -C ./project-spec/meta-user/
#tar -xzvf ../../common/recipes-bsp-fmc133v-v11.tgz -C ./project-spec/meta-user/
tar -xzvf ../../common/recipes-bsp-fmc138m.tgz -C ./project-spec/meta-user/

exit 0
