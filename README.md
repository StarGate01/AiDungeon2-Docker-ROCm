# AiDungeon2-Docker-ROCm
Runs an [AIDungeon2](https://github.com/latitudegames/AIDungeon) fork in [Docker](https://www.docker.com/) on [AMD ROCm](https://rocmdocs.amd.com/en/latest/) hardware.

The [Clover-Edition](https://github.com/cloveranon/Clover-Edition) for of *AIDungeon2* uses [PyTorch](https://pytorch.org/), which supports AMD ROCm capable GPUs in addition to the more widely used Nvidia CUDA GPUs.

This project build a docker container based on [`rocm/pytorch`](https://hub.docker.com/r/rocm/pytorch), containing everything to play the game on an AMD GPU. Tested on Ubuntu 20 with a Vega 56 card.

## Setup
Install Docker and the AMD ROCm kernel module on your host (see https://rocmdocs.amd.com/en/latest/Installation_Guide/Installation-Guide.html).

Run `./build.sh` to build the Docker container. 

Then run `./run.sh bash download_model.sh` to download the model (via torrent, you can cancel the seeding after the download has finished if you want by pressing CTRL-C). The model and saved games will be stored in the `persistent-data` directory, which is mounted into the Docker container.

Test your installation using `./run.sh /app/test/test.sh`. It should output detailed info about your GPU and compute capabilities. It should end like this:
```
Testing ROCm-CUDA on pyTorch
CUDA(hip) is available:  True
CUDA(hip) device_count:  1
Device name:  Device 687f
```

## Usage
To run the game, execute `./run.sh` .

To monitor the gpu usage on your host, execute `watch /opt/rocm/bin/rocm-smi` .

