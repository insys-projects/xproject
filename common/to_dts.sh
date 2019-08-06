#!/bin/bash

dtc -I dtb $1 -O dts -o $2

echo DONE...

exit 0
