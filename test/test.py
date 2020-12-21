#!/usr/bin/env python3

import torch

print("Testing ROCm-CUDA on pyTorch")

print('CUDA(hip) is available: ', torch.cuda.is_available())
print('CUDA(hip) device_count: ', torch.cuda.device_count())
print('Device name: ', torch.cuda.get_device_name(torch.cuda.current_device()))