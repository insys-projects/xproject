#!/bin/bash

source /opt/xilinx/sdk/settings64.sh

CPU=zynq
BIF=qspi_zynq.bif

bootgen -image ${BIF} -arch ${CPU} -w -o i qspi_zynq.bin

exit 0