# Project Name: Animal Behaviors and a Pinch of Camera

“The cat told me that she was sick,” a child said. Though, can cats talk? 
Despite the countless development in artificial intelligence and computer vision world, this did not bring enough animal welfare to date. To illustrate, no communication tool between animals and humans determines the extent of their needs and diseases that we do not feel. Accordingly, we aim to build a model for animal behavior analysis in a few seconds — without resorting to a veterinarian and longtime detection. 

`The present work selects cats’ behaviors due to the lack of biological investigations for the rest of the animals.` 

In contrast, this will be a turning point for all animals’ behavior analysis by OpenCV functions. Cat’s tail signals are some of the coolest body language signs that tell the cat's behavior. Moreover, every movement of the tail has a meaning. For instance, the straight-up tails are signals that your cat is feeling friendly or content. The same is for the other parts of the body; the lowered headcat means they are feeling aggressive, inferior or submissive. Furthermore, if the mouth is slightly open and the nose is barely wrinkled, this could be a sign of displeasure or disgust. Cat facial detection, landmark recognition and segmentation process are the keys to highlighting the medical investigation data. To figure this out, we use them to create points on the edge of the part that is assigned to (x, y) coordinates. This detects the increasing or decreasing of distances between every two Cartesian points to predict the shape that will give the exact feeling of cats (if the cat closes slightly her eyes, the distance between the two points decreases). 

As each cat has a different-sized landmark, the model compares the distances according to a ratio with respect to the square of landmarks’ recognition. Eventually, there is a platform that is a user interface to scan the cat’s behavior through the camera or videos and prints simultaneously the detection result.

## Aim
The present work selects cats’ behaviors due to the lack of biological investigations for the rest of the animals. In contrast, this will be a turning point for all animals’ behavior analysis by OpenCV functions. As humans have built-in functions in OpenCV library for landmarks detection and more investigations regarding their non verbal communication like their movement of hands and facial expressions, this project is built to approach this aim.


## Research Background 
During the search, we did not find any model that cared about this matter before, except for some research on insects, but caring for our pets and making animal behavior analysis is a rare matter in this technological crowd, although it is important for all of us. so, we started collecting data from cited platforms that gives the correct biological data about animals then we started making out unique model to help making a start point in this field as addition to the community of AI.

![image](https://user-images.githubusercontent.com/101527083/222715960-27dd9270-b058-41b5-9d69-bda6dff192f0.png)

The beginning before we started coding was to collect all 
the information that expresses the cat’s body language and 
compile it for use in the code, as in figure (1) and the data we 
used are shown in table (1), (2) and (3)

![image](https://user-images.githubusercontent.com/101527083/222716074-96c41735-96fb-4c22-8e7e-588cca6c6792.png)
#### Cat Tail 
![image](https://user-images.githubusercontent.com/101527083/222716186-4602718a-b052-4f60-92df-2887e72132e7.png)

![image](https://user-images.githubusercontent.com/101527083/222716248-2ee6c9a2-eb8b-454c-bd2e-c904669d57f0.png)

## Methodology 
To build this model, we went through several stages, which will be detailed in the following lines.
### Cat detection 
The first step in the implementation was to identify the cat or cats in the picture. This was to avoid the detection of any other objects as cats — the human eyes are like the cat’s eyes in the computer vision consideration. To build the recognition code first, some libraries were imported such as:
* `Torch` : Library that starts making a deep neural network to make detection faster and more accurate
* `Matplotlib` : This library helps in making 2d graphs and visualization. We used it for visualization, so that when we start zooming in or in case we have a low-quality image, the detection won’t be affected.
* `NumPy` : This library is based on linear algebra, so it always takes data and converts it into a matrix. It is used in data manipulation, and through it we can convert images to grids to facilitate the detection of a specific part.
* `OpenCV (cv2)` : It contains pre-trained data for various objects, including animals, plants, body parts, and more. So, we started working with the part that we want to make the process easier for the model training.

![image](https://user-images.githubusercontent.com/101527083/222717150-48bc4002-f5df-4187-ab92-9dce330ad277.png)

Then we imported yolo v5 model. This model is very fast in detection, as it can detect the image in about 0.007 part of a second, and in videos, it can detect at rate of 140 frames per second. After that, an update is made for the results by placing the box around the image and labeling it. 

![image](https://user-images.githubusercontent.com/101527083/222717272-aed11d70-fc44-43d0-82c2-517f39eb17b2.png)

The camera is turned on and it starts detecting anything in front of it in the video if the camera is running.

![image](https://user-images.githubusercontent.com/101527083/222717415-c791eabf-d713-4b95-9c58-47ee51ee5b38.png)


While the detection is working, it activates the custom model that we made to be able to detect the cat .Then Force reload was used to start clearing the existing cache from the main model and start working with the model that we trained. This is shown in the following code:

![image](https://user-images.githubusercontent.com/101527083/222717537-8d8e85a8-48e4-4906-bda6-be1cc2b9c38e.png)

Then how many cats are in the picture will be printed in the terminal via the following code:

![image](https://user-images.githubusercontent.com/101527083/222717667-f5263e0b-b3b1-4050-9485-53bb76e3df1d.png)

Finally, the cat image is displayed and plotted by placing it on the x and y axis, and specific points are determined after that the cat itself begins to be determined as shown in figure (2).

![image](https://user-images.githubusercontent.com/101527083/222717847-945ef053-8530-40da-bd8b-f9e580f74bc9.png) ![image](https://user-images.githubusercontent.com/101527083/222717800-436d8d3b-c4ed-4024-a0c7-75f1820c9e10.png)






