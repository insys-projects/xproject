
PWD=`pwd`
PRJ_ROOT=${PWD}/$1/project

source /opt/xilinx/sdk/settings64.sh

export INSYS_BOARD=fmc133v
export BOARD=${INSYS_BOARD}
export TOOLCHAIN_PATH=/opt/xilinx/sdk/aarch64/lin/aarch64-linux/bin
export TARGET_SYS=aarch64-linux-gnu


export CC=${TARGET_SYS}-gcc
export CPP="${TARGET_SYS}-gcc"
export CXX="${TARGET_SYS}-gcc"
export NM=${TARGET_SYS}-nm
export RANLIB=${TARGET_SYS}-ranlib
export OBJCOPY=${TARGET_SYS}-objcopy
export STRIP=${TARGET_SYS}-strip
export AS=${TARGET_SYS}-as
export AR=${TARGET_SYS}-ar
export OBJDUMP=${TARGET_SYS}-objdump
export PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
export PATH=${TOOLCHAIN_PATH}:${PATH}
export CROSS_COMPILE=${TARGET_SYS}-
export ARCH=arm

if [[ ${PETALINUX_VER} = "2017.4" ]]
then
BUILD_KERNEL_DIR=build/tmp/work/plnx_arm-xilinx-linux-gnueabi/linux-xlnx
BUILD_KERNEL_VER=4.9-xilinx-v2017.4+gitAUTOINC+b450e900fd-r0/linux-plnx_arm-standard-build
export KERNELDIR=${PRJ_ROOT}/${BUILD_KERNEL_DIR}/${BUILD_KERNEL_VER}
fi

if [[ ${PETALINUX_VER} = "2018.2" ]]
then
BUILD_KERNEL_DIR=build/tmp/work/plnx_zynq7-xilinx-linux-gnueabi/linux-xlnx
BUILD_KERNEL_VER=4.14-xilinx-v2018.2+gitAUTOINC+ad4cd988ba-r0/linux-plnx_zynq7-standard-build
export KERNELDIR=${PRJ_ROOT}/${BUILD_KERNEL_DIR}/${BUILD_KERNEL_VER}
fi

if [[ ${PETALINUX_VER} = "2019.1" ]]
then
BUILD_KERNEL_DIR=build/tmp/work/plnx_zynq7-xilinx-linux-gnueabi/linux-xlnx
BUILD_KERNEL_VER=4.19-xilinx-v2019.1+gitAUTOINC+9811303824-r0/linux-plnx_zynq7-standard-build
export KERNELDIR=${PRJ_ROOT}/${BUILD_KERNEL_DIR}/${BUILD_KERNEL_VER}
fi

if [[ ${PETALINUX_VER} = "" ]]
then
    echo "PETALINUX environment not set! Please, do: source /opt/xilinx/petalinux/settings.sh"
    return -1;
fi

if [ ! -d ${KERNELDIR} ];
then
    echo "KERNELDIR does not exist! Build petalinux project before."
    return -1;
fi

export INSTALL_MOD_PATH=${HOME}/targetfs-${BOARD}
export PATH=${TOOLCHAIN_PATH}:${PATH}
export PS1="\[\e[32;1m\][${BOARD}]\[\e[0m\]:\w> "

echo "==================================================="
echo " PRJ_ROOT: ${PRJ_ROOT}"
echo "==================================================="
echo "==================================================="
echo " TOOLCHAIN_PATH: ${TOOLCHAIN_PATH}"
echo "==================================================="
echo "==================================================="
echo " KERNELDIR: ${KERNELDIR}"
echo "==================================================="