#!/usr/bin/env python3

import torch

print("Testing ROCm-CUDA on pyTorch")

print('CUDA(hip) is available', torch.cuda.is_available())
print('cuda(hip)_device_num:', torch.cuda.device_count())
print('Radeon device:', torch.cuda.get_device_name(torch.cuda.current_device()))