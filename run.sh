#!/bin/bash

GID_VIDEO=$(getent group video | awk -F: '{printf "%d\n", $3}')
GID_RENDER=$(getent group render | awk -F: '{printf "%d\n", $3}')

echo "Using groups: $GID_VIDEO, $GID_RENDER"

docker run -it --network=host --device=/dev/kfd --device=/dev/dri --group-add $GID_VIDEO --group-add $GID_RENDER --ipc=host --shm-size 16G --security-opt seccomp=unconfined stargate01/aidungeon2-rocm:latest