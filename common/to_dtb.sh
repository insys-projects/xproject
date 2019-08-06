#!/bin/bash

dtc -I dts $1 -O dtb -o $2

echo DONE...

exit 0
