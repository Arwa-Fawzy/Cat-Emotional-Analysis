#  DeepCat: A Deep Learning Aproach to Understand Your Cat's Body Language

“The cat told me that she was sick,” a child said. Though, can cats talk? 

Despite the countless development in artificial intelligence and computer vision world, `this did not bring enough animal welfare to date`. To illustrate, no communication tool between animals and humans determines the extent of their needs and diseases that we do not feel. Accordingly, we aim to build a model for animal behavior analysis in a few seconds — without resorting to a veterinarian and longtime detection. 

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

Finally, the cat image is displayed. 

![image](https://user-images.githubusercontent.com/101527083/222717800-436d8d3b-c4ed-4024-a0c7-75f1820c9e10.png)

It is  plotted by placing it on the x and y axis, and specific points are determined after that the cat itself begins to be determined as shown in figure (2).

![image](https://user-images.githubusercontent.com/101527083/222717847-945ef053-8530-40da-bd8b-f9e580f74bc9.png) 

### YOLO v5 
First, we identified the parts of the cat's body that will be visible to determine the change in them and thus give the most accurate information about the cat's condition. Our dependence in the code was on 3 parts, the Eyes, the Tail, and the Mouth as shown in the figure: 

### The Eyes part
##### It contains three parts:
The first part is responsible for capturing the `eyes` and making an analysis of them, such as making a contour around them and calculating the ratio between white and black, and on this basis, we will determine whether the eye is wide open or not.

![image](https://user-images.githubusercontent.com/101527083/222718986-251b064e-2034-47b4-ad48-f93189dfbeaa.png)

* The second part is responsible for compilation, especially in video situations, because every second something different will be captured, so every second it calculates the first part, then in the end it counts them and gives the most visible thing from the second function as a result. 
 
### The Mouth part
The mouth part: the code is simple, it tells us what appeared in the first function, according to the end of the Yolo need to catch it, the second function: it is also considered as a counter
##### It consists of two functions:
* Mouth detection:
This is what we use to determine the case in relation to the frame or the 
image, in a true sense, if the image is caught with a closed mouth, it tells you 
what the case was and so on.
* Mouth behavior:
This is considered a counter, so that in each frame it says what appeared and sees the most appeared thing and tells what expresses the condition of the cat

### The tail part:
Divided into four parts:
* The first part that is the detection of the tail: it is responsible for making a contour and defining the maximum from each point, right, left, above and below, and we see which is greater in length or width, while the length is greater, so this means that the tail is straight to the top, almost standing, so we depend on the point above and below, if the width It is the largest, this means that the tail is on the x axis, so we depend on the right and the left.
* The gradient function which concerned with the slope. 
* The third function is responsible for the calculations and gives us the result
* The last function is like the second function in the eyes, which do you think is the most visible thing, especially if it is in a video.

In more details, Yolo makes a bounding box for the cat's tail, and the tail detection code works on the box that contains the tail. The main idea is to make a contour for the tail, but before that we set a threshold and after that we start to make the contour. We make the contour because we want to define the points on the tail that we will use to indicate the state of movement of the tail. Whichever is greater, the difference between the left and right points or the top and bottom points is the largest. And according to which of them is greater, the shape of the tale is changed vertically or horizontally.

Then we measure the angle with OpenCV where we have the coordinates of the points on the tail and the length between the points so that the angle is determined and converted to degrees. The states of the tail are indicated so the meaning is known according to these accounts

![image](https://user-images.githubusercontent.com/101527083/222719961-58873141-1221-4bec-9251-9fd3d7c04d63.png)

###### These steps are all shown in figure (3) from a to d.

![image](https://user-images.githubusercontent.com/101527083/222720150-af5abe33-60d6-4f2f-934d-b88378fbfe3b.png)

The next step was to collect as many pictures of cats with different qualities as possible to train the model. Then we used the Labelimg program to select the parts using boxes to be inserted into the model. 

In `image analysis`, we collect everything from what was mentioned before, with a function called Splitter, and it divides them into 8 parts in a list in order to increase the organization. Then the second main function detects everything, and, in the end, it gives the case, and at the same time it saves pictures of what was detected and how we analyzed them to show them in the program.

![image](https://user-images.githubusercontent.com/101527083/222720483-29f65b7c-cf73-473e-b0df-83d11a622b14.png)

The previous code is what we use for the detection process at the end. Inside this function, we call other functions, all of them for the same purpose, which is image detection. The explanation of all the functions is written in the comments in the code.

In the case of analyzing the videos: it is considered the same image, but the counter is used in the end, because every second the cat can make a different movement. It is determined what appeared the most and we depend on it, so that if there is an error, it is controlled.

For the model training we used YOLO v5, and this is a pretrained model, which consists of a lot of layers, but we only change the weight according to the data that we enter for it, and through this model we were able to get the results we want (determining the cat’s condition depending on its body language). While training the model we got some graphs. Some of them as shown in figure (4). These graphs represent loss graphs or the error on the training dataset.

![image](https://user-images.githubusercontent.com/101527083/222720889-33e810ac-1462-4856-b9fe-66c682e840a9.png)

To create the program, the Pygame library was used. It is a library used to create games, but we used it to make a good and enjoyable look for users, as if it were a game. The program is very simple. It says the status of the cat, and then quits. If the user wants to try again, he should ring again.

## User Interfaces 

### Game Interface
It is necessary for any machine-learning model to handle a familiar connection between the user and the code output. Therefore, the following image illustrates our funny user interface for cat owners:

![image](https://user-images.githubusercontent.com/101527083/222721603-7b093dab-f1be-445c-ba33-9468b62431e8.png)


![image](https://user-images.githubusercontent.com/101527083/222721224-7bef6efd-8d27-496f-847f-d926c7722714.png)


### Flutter application

To be more professional and adding more services like the following
* sign up to the application and get notifications for the cat behaviors
* getting tips for regular grooming 
* access the the user's (cat owner) location to inform him the nearest veterinary hospital to treat the cat if it is detected as sick


![image](https://user-images.githubusercontent.com/101527083/227616273-a7952b1d-7828-4086-9666-bddd01c9c8e2.png)


![hhhh](https://user-images.githubusercontent.com/101527083/232243189-c4aff441-1db3-4632-a737-11d6952224d7.jpg)


## Weakness points:
* The cat changes its behavior for each second and our detected cases should include more cases 
* The goal of animal welfare is extented to more animals in farms that their behaviors can affect on the economics (cows, buffalo ...etc)

## Future plans 
* We are now building a modern architectures such as a transformers, LSTM, or attection model within `CNN` (convolutional neural network) to be more accurate for the cat body language 
* We are searching for a trusted reference for the biological data of the rest of animals regarding their body languages and behaviors
* Cat Voice analysis to get higher accuracy of cat behavior detection

## References 
* Cats Protections Organization in UK (Cat body language - cat behaviour help & advice)
* Zhao, Z. (2020). Using Notational Systems to Represent the Relationship of Cats’ Postures and Facial Expression (Doctoral dissertation, Northeastern University)
* World Small Animal Veterinary Association Book
* Aggression in cats. ASPCA
* Zedespook, Kbarni, Berak, Crackwitz, & StringTheory. (2021, April 9). `How can I tell the angle from a horizontal line? OpenCV` 
* Eagan, B., Eagan, B., & Protopopova, A. (2022). BeRSTID: A Behaviour Real-Time Spatial Tracking Identification System
* Liu, C., Tao, Y., Liang, J., Li, K., & Chen, Y. (2018, December). Object detection based on YOLO network. In 2018 IEEE 4th Information Technology and Mechatronics Engineering Conference (ITOEC) (pp. 799-803). IEEE

## Credits
* This project was created by three Engineering students: Ahmed Mohamed, Ahmed Anwar, Heba Yasser and me  — a computer science student — Arwa Fawzy, December 2022.
* This project was documented in a research paper and patent by two Engineering students: Ahmed Mohamed, Ahmed Anwar, and me  — a computer science student — Arwa Fawzy, supervised by Dr. Haitham El-Husseiny and Dr. Ahmed Bayoumy in Egypt Japan University for Science and Technology, September 2023.

## Awards and certifications
* The project recieved the `Third Prize` in OpenCV AI competition 2022 
* The project participated in `Google Challenge Solution Global Contest 2023` 
* The project was submitted to `International Japan-African Conference on Electronics, Communication and Computations IEEE` 
 













