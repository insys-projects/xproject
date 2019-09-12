#!/bin/bash

source /opt/xilinx/sdk/settings64.sh

bootgen -w -image bitconv.bif -arch zynq -process_bitstream bin

exit 0
