#!/bin/bash

echo "Testing ROCm"
ls /dev/dri/
/opt/rocm/bin/rocm-smi
/opt/rocm/bin/rocminfo
/app/test/test.py