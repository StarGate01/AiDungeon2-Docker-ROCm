#!/bin/bash

GID_VIDEO=$(getent group video | awk -F: '{printf "%d\n", $3}')
GID_RENDER=$(getent group render | awk -F: '{printf "%d\n", $3}')
MAPDIR=$(readlink -e ./persistent-data/)
GAMEDIR=$(readlink -e ./KoboldAI-Client/)

echo "Using groups: $GID_VIDEO, $GID_RENDER, mapping directory $MAPDIR"

XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
docker run -it --net=host -v $XSOCK:$XSOCK -v $XAUTH:$XAUTH -e XAUTHORITY=$XAUTH -e DISPLAY=$DISPLAY -v "$GAMEDIR:/app/game:rw" -v "$MAPDIR/models:/app/models:ro" -v "$MAPDIR/cache:/app/cache:rw" -p 5000:5000 --device=/dev/kfd --device=/dev/dri --group-add $GID_VIDEO --group-add $GID_RENDER --shm-size 8G aidungeon2-rocm:latest "$@"