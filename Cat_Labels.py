from Settings_Libraries import *

#Here Our First Part of the Project, Where we began to label everything to detect.

#First , Eyes

def eye_detection(img,image_cordinate):
    #Giving the coordinates of the image after using yolo5, we cut it to begin to work on it to give us the case as we begin to do segmentation.
    Cropped_Eye = img[ int(image_cordinate[1]):int(image_cordinate[3]),int(image_cordinate[0]):int(image_cordinate[2])]
    gray = cv2.cvtColor(Cropped_Eye, cv2.COLOR_BGR2GRAY)
    # blur
    blur = cv2.GaussianBlur(gray, (0,0), sigmaX=33, sigmaY=33)
    # divide
    divide = cv2.divide(gray, blur, scale=255)
    # otsu threshold
    thresh = cv2.threshold(divide, 0, 255, cv2.THRESH_BINARY+cv2.THRESH_OTSU)[1]
    # apply morphology
    kernel = cv2.getStructuringElement(cv2.MORPH_RECT, (3,3))
    morph = cv2.morphologyEx(thresh, cv2.MORPH_CLOSE, kernel)
    #Saving the image to display in the application
    plt.axis('off')
    plt.imshow(morph,cmap='gray')
    plt.savefig('eye_detection.png')
    #Calculating the ratio of the eye's area compared to the box
    number_of_white_pix = np.sum(morph >= 10)
    number_of_pix = np.sum(morph >= -100)
    White_Area_Ratio = number_of_white_pix/number_of_pix
    White_Area_Ratio = White_Area_Ratio * 100
    Area = 100 - White_Area_Ratio
    #What to return based on the area
    if Area >= 37.5:
        return 'Friendly'
    elif Area >= 19:
        return 'Relaxed'
    elif Area > 5:
        return 'aggressive'
    else : return 0

#Here we make a counter to calculate each case for every frame when we upload video and return the most appearance case
def eye_behavior(list_of_eyes):
    eye_behavior_dict = {0: 0
        , 'Friendly': 0
        , 'Relaxed': 0
        , 'aggressive': 0}
    # check what is the most repeated case in the tail indications for each second
    for area in list_of_eyes:
        if area == 'Friendly':
            eye_behavior_dict['Friendly'] += 1
        elif area == 'Relaxed':
            eye_behavior_dict['Relaxed'] += 1
        elif area == 'aggressive':
            eye_behavior_dict['aggressive'] += 1

    sorted_appearance_behavior = sorted(eye_behavior_dict.items(), key=lambda x: x[1])
    most_appearance_behavior = sorted_appearance_behavior[-1][0]
    most_appearance_behavior_value = sorted_appearance_behavior[-1][1]
    total_values = sum(eye_behavior_dict.values())
    # getting the most appearance indication, its time to be shown and the total time of other indicators to know the ratio of the most apparent indication with other indications
    return most_appearance_behavior, most_appearance_behavior_value, total_values


#here based on what yolo5 detects about the mouth, it return the case.
def mouth_detection(mouth_coordinate):
    if int(mouth_coordinate[5]) == 3:
        return 'NaN'
    elif int(mouth_coordinate[5]) == 5:
        return 'Seeing Intersting Visualiztion'
    elif int(mouth_coordinate[5]) == 4:
        return 'Aggressive'
#Here to make a counter to calculate each mouth case for every frame when we upload video
def mouth_behavior(list_of_mouths):
    mouth_behaviour_dict = { 0:0,
        'Seeing Intersting Visualiztion': 0,
                            'Aggressive': 0}
    # check what is the most repeated case in the tail indications for each second
    for i in list_of_mouths:
        if (i == 'Aggressive'):
            mouth_behaviour_dict['Aggressive'] += 1
        elif (i == 'Seeing Intersting Visualiztion'):
            mouth_behaviour_dict['Seeing Intersting Visualiztion'] += 1

    sorted_appearance_behavior = sorted(mouth_behaviour_dict.items(), key=lambda x:x[1])
    most_appearance_behavior = sorted_appearance_behavior[-1][0]
    most_appearance_behavior_value = sorted_appearance_behavior[-1][1]
    total_values = sum(mouth_behaviour_dict.values())
    # getting the most appearance indication, its time to be shown and the total time of other indicators to know the ratio of the most apparent indication with other indications
    return most_appearance_behavior,most_appearance_behavior_value,total_values


# calculating the length and width of the bounding box surrounded by tail
def tail_detection(img,tail_coordinates):
    tail = img[int(tail_coordinates[1]):int(tail_coordinates[3]),int(tail_coordinates[0]):int(tail_coordinates[2])]
    height = abs(int(tail_coordinates[1])- int(tail_coordinates[3]))
    width = abs(int(tail_coordinates[0])- int(tail_coordinates[2]))
    # converting the tail from RGB into grayscale
    gray_img = cv2.cvtColor(tail,cv2.COLOR_BGR2GRAY)
    # thresholding the tail
    ret,thre = cv2.threshold(gray_img,127,255,
                             cv2.THRESH_BINARY_INV+cv2.THRESH_OTSU)
    kernel = np.ones((3,3),dtype=np.uint8)
    opening = cv2.morphologyEx(thre,cv2.MORPH_OPEN,kernel,iterations =2)
    sure_bg_1 = cv2.dilate(opening,kernel,iterations = 2)
    sure_bg_1 = sure_bg_1.astype(np.uint8)
    ret,markers_1 = cv2.connectedComponents(sure_bg_1)
    markers_1 = markers_1.astype(np.uint8)
    # after thresholding, contouring the black part which is cat's tail
    cnts = cv2.findContours(markers_1, cv2.RETR_EXTERNAL,cv2.CHAIN_APPROX_SIMPLE)
    cnts = imutils.grab_contours(cnts)
    #canceling the other contoured parts around the tail by getting the maximum contouring area
    c = max(cnts, key=cv2.contourArea)
    # using imutils to assign a colored point on the maximum point from left, right, up and down
    extLeft = tuple(c[c[:, :, 0].argmin()][0])
    extRight = tuple(c[c[:, :, 0].argmax()][0])
    extTop = tuple(c[c[:, :, 1].argmin()][0])
    extBot = tuple(c[c[:, :, 1].argmax()][0])
    # drawing colored circle on each max point
    cv2.drawContours(tail, [c], -1, (0, 255, 255), 2)
    cv2.circle(tail, extLeft, 8, (0, 0, 255), -1)
    cv2.circle(tail, extRight, 8, (0, 255, 0), -1)
    cv2.circle(tail, extTop, 8, (255, 0, 0), -1)
    cv2.circle(tail, extBot, 8, (255, 255, 0), -1)
    plt.axis('off')
    plt.imshow(tail,cmap='gray')
    plt.savefig('tail_detection.png')
    # getting the tail length by knowing if it is held vertical or horizontal by comparing the tallest distance
    if width > height:
        return extLeft,extRight
    elif height > width :
        return extTop,extBot

#subtracting X2-X1 and Y2-Y1 and dividing them on each others to know the gradient
def gradient(firstPoint, secondPoint):
    return (secondPoint[1] - firstPoint[1]) / (secondPoint[0] - firstPoint[0])
def getAngle(firstPoint, secondPoint, thirdPoint):
    m1 = gradient(firstPoint, secondPoint)
    m2 = gradient(firstPoint, thirdPoint)
    # a famous mathematical rule to know the angle by inversing tan
    angle_in_rad = math.atan((m2 - m1) / (1 + (m2 * m1)))
    # converting the angle from rad to degree and round it
    angle_in_degrees = abs(round(math.degrees(angle_in_rad)))
    # setting the medical estimations according to the elevation angle of the cat's tail
    if (angle_in_degrees > 30 and angle_in_degrees < 60):
        return 'Aggressive or Frightened'
    elif (angle_in_degrees >= 0 and angle_in_degrees <= 30):
        return 'Relaxed and Confident'
    elif (angle_in_degrees >= 60):
        return 'Friendly and happy'

#check what is the most repeated case in the tail indications for each second
def tail_behavior(list_of_tails):
    tail_behaviour_dict = {0: 0,
                           'Aggressive or Frightened': 0,
                           'Relaxed and Confident': 0,
                           'Friendly and happy': 0}
    for i in list_of_tails:
        if (i == 'Aggressive or Frightened'):
            tail_behaviour_dict['Aggressive or Frightened'] += 1
        elif (i == 'Relaxed and Confident'):
            tail_behaviour_dict['Relaxed and Confident'] += 1
        elif (i == 'Friendly and happy'):
            tail_behaviour_dict['Friendly and happy'] += 1

    sorted_appearance_behavior = sorted(tail_behaviour_dict.items(), key=lambda x: x[1])
    most_appearance_behavior = sorted_appearance_behavior[-1][0]
    most_appearance_behavior_value = sorted_appearance_behavior[-1][1]
    total_values = sum(tail_behaviour_dict.values())
    # getting the most appearance indication, its time to be shown and the total time of other indicators to know the ratio of the most apparent indication with other indications
    return most_appearance_behavior, most_appearance_behavior_value, total_values

def Graphing():
    from matplotlib import pyplot as plt
    from matplotlib import image as mpimg
    lst_images = []
    fig = plt.figure(figsize=(10, 7))
    if os.path.exists('image_detection.png'):
        image_cat = cv2.imread('image_detection.png')
        lst_images.append([image_cat,0])
        os.remove('image_detection.png')
    if os.path.exists('eye_detection.png'):
        image_eye = cv2.imread('eye_detection.png')
        lst_images.append([image_eye,1])
        os.remove('eye_detection.png')
    if os.path.exists('tail_detection.png'):
        image_tail = cv2.imread('tail_detection.png')
        lst_images.append([image_tail,2])
        os.remove("tail_detection.png")

    for i in range(len(lst_images)):
        # Adds a subplot at the 1st position
        fig.add_subplot(1, len(lst_images), i+1)

        # showing image
        plt.imshow(lst_images[i][0])
        plt.axis('off')
        try:
            if lst_images[i][1] == 0:
                plt.title("Cat")
            elif lst_images[i][1] == 1:
                plt.title("Eye After Thresholding")
            elif lst_images[i][1] == 2 :
                plt.title("Tail")
        except:
            continue

