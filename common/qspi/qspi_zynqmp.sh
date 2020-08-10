#!/bin/bash

source /opt/xilinx/sdk/settings64.sh

CPU=zynqmp
BIF=qspi_zynqmp.bif

bootgen -image ${BIF} -arch ${CPU} -w -o i BOOT.BIN
cp BOOT.BIN qspi_zynqmp.bin

exit 0