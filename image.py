from Cat_Labels import *
from Settings_Libraries import *

def Priority_Function_for_images(cases):
    cases = list(cases)
    cases_detected = [case for case in cases if type(case) == str]
    if len(cases_detected) == 0:
        return "Sorry, We Couldn't detect the case"
    else:
        return cases_detected[0]

# knowing the landmark that has highest accuracy to use its coordinates for detection
def list_spilter_Images(image_func):
    Eye_images = [x for x in image_func if int(x[5]) == 1]
    Tail_images = [x for x in image_func if int(x[5]) == 2]
    Ear_images = [x for x in image_func if int(x[5]) == 0]
    Mouth_images = [x for x in image_func if int(x[5]) == 3 or int(x[5]) == 4 or int(x[5]) == 5]
    Acc_Max = 0
    Best_eye_image = []
    for i in Eye_images:
        if float(i[4]) > Acc_Max:
            Best_eye_image = i
            Acc_Max = float(i[4])
    Best_tail_image = []
    Acc_Max = 0
    for i in Tail_images:
        if float(i[4]) > Acc_Max:
            Best_tail_image = i
            Acc_Max = float(i[4])
    Best_ear_image = []
    Acc_Max = 0
    for i in Ear_images:
        if float(i[4]) > Acc_Max:
            Best_ear_image = i
            Acc_Max = float(i[4])
    Best_mouth_image = []
    Acc_Max = 0
    for i in Mouth_images:
        if float(i[4]) > Acc_Max:
            Best_mouth_image = i
            Acc_Max = float(i[4])
    return Eye_images,Tail_images,Ear_images,Mouth_images,Best_tail_image,Best_ear_image,Best_eye_image,Best_mouth_image

#getting the image as an input
def image_detection(image_path):
    tail_case = 0
    eye_case = 0
    mouth_case = 0
    img = os.path.join(image_path)
    results = model(img)
    results.print()
    # showing the image after detection
    plt.imshow(np.squeeze(results.render()))
    plt.axis('off')
    plt.savefig('image_detection.png')
    img = cv2.imread(image_path)
    image_list = results.xyxy[0]
    # getting the coordinates of detected landmarks
    eye_images,tail_images,ear_images,mouth_images,best_tail_image,best_ear_image,best_eye_image,best_mouth_image = list_spilter_Images(image_list)
    # check the most apparent indicator among indicators that have the highest accuracy
    if len(best_eye_image) > 0:
        eye_case = eye_detection(img,best_eye_image)
    if len(best_tail_image) > 0:
        firstpoint,secondpoint = tail_detection(img,best_tail_image)
        tail_case = getAngle(firstpoint,secondpoint,[best_tail_image[0],best_tail_image[1]])
    if len(best_mouth_image) > 0:
        mouth_case = mouth_detection(best_mouth_image)
    # applying the medical priority estimation by calling the one that comes first in the cases list
    cases = [tail_case,mouth_case,eye_case]
    Detected_case = Priority_Function_for_images(cases)
    Graphing()
    return Detected_case
