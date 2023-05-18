import sys
import tkinter.filedialog
import torch
from matplotlib import pyplot as plt
import numpy as np
import math
import cv2
import os
import time
import imutils

IMAGES_PATH = os.path.join('data', 'images') #/data/images
labels = ['Ear', 'Eye','Tail','Mouth']
number_imgs = 307

model = torch.hub.load('ultralytics/yolov5', 'custom', path='yolov5/runs/train/exp2/weights/best.pt', force_reload=True)