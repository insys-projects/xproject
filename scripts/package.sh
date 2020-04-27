#!/bin/bash

if [[ ${PETALINUX_VER} = "2017.4" ]]
then
FPGABIN=fmc130e_v11_z045_fmctest.bit
fi
if [[ ${PETALINUX_VER} = "2018.2" ]]
then
FPGABIN=system.bit
fi
if [[ ${PETALINUX_VER} = "2018.3" ]]
then
FPGABIN=system.bit
fi
if [[ ${PETALINUX_VER} = "2019.1" ]]
then
FPGABIN=system.bit
fi

cd ./project/images/linux

#
# Сформируем файл BOOT.BIN из zynq_fsbl.elf и u-boot.elf и добавим битстрим ${FPGABIN}
#
#petalinux-package --force --boot --fsbl zynq_fsbl.elf --fpga ${FPGABIN} --u-boot u-boot.elf

#
# Сформируем файл BOOT.BIN только из zynq_fsbl.elf и u-boot.elf
#
petalinux-package --force --boot --fsbl zynq_fsbl.elf --u-boot u-boot.elf

exit 0