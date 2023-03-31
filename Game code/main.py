from image import *
from video import *

Choice=int(input("If you want to upload image write 1, if you want video write 0"))

while Choice:
    if Choice==1:
        catPath=input("enter the path of image ")
        print(image_detection(catPath))
        break
    else:
        catVid=str(input("enter the path of video "))
        print(video_detection(catVid))
        break
