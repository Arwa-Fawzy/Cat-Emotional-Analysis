import pygame
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

pygame.init()
x = 1280
y = 720
SCREEN = pygame.display.set_mode((x, y))
pygame.display.set_caption("Menu")
image_lst = ['jpg','png','jpeg','jfif']
video_lst = ['mp4','mov']

BG = pygame.image.load("assets/Background.jpg").convert_alpha()
BG = pygame.transform.scale(BG, (x, y))