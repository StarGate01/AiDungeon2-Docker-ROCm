#!/bin/bash

GID_VIDEO=$(getent group video | awk -F: '{printf "%d\n", $3}')
GID_RENDER=$(getent group render | awk -F: '{printf "%d\n", $3}')
MAPDIR=$(readlink -e ./persistent-data/)

echo "Using groups: $GID_VIDEO, $GID_RENDER, mapping directory $MAPDIR"

docker run -it -v "$MAPDIR/models:/app/game/models:rw" -v "$MAPDIR/saves:/app/game/saves:rw" --device=/dev/kfd --device=/dev/dri --group-add $GID_VIDEO --group-add $GID_RENDER --shm-size 8G aidungeon2-rocm:latest "$@"