from Cat_Labels import *
from Settings_Libraries import *


def video_detection(video_path):
    cap = cv2.VideoCapture(video_path)
    list_of_eye_area = []
    list_of_tails = []
    list_of_mouths = []
    #To read each frame
    while cap.isOpened():
        ret, frame = cap.read()

        # Make detections for each frame and save it in a list
        results = model(frame)
        labels_coordinates = results.xyxy[0]
        for i in labels_coordinates:
            if int(i[5]) == 1 and float(i[4]) > 0.5:
                eye_area_calculator = eye_detection(frame, i)
                list_of_eye_area.append(eye_area_calculator)
            if int(i[5]) == 2 and float(i[4]) > 0.5:
                firstpoint, secondpoint = tail_detection(frame, i)
                tail_case = getAngle(firstpoint, secondpoint, [i[0], i[1]])
                list_of_tails.append(tail_case)
            if (int(i[5]) == 3 or int(i[5]) == 4 or int(i[5]) == 5) and float(i[4]) > 0.5:
                mouth_case = mouth_detection(i)
                list_of_mouths.append(mouth_case)
        cv2.imshow('YOLO', np.squeeze(results.render()))

        if cv2.waitKey(10) & 0xFF == ord('q'):
            break
    cap.release()
    cv2.destroyAllWindows()
    #Using functions , we determine the most appearing case
    eye_most_appearing_case = eye_behavior(list_of_eye_area)
    tail_most_appearing_case = tail_behavior(list_of_tails)
    mouth_most_appearing_case = mouth_behavior(list_of_mouths)
    appearing_cases = [eye_most_appearing_case, tail_most_appearing_case, mouth_most_appearing_case]
    #Return the most appearing case in all cases
    max_case_value = 0
    for i in appearing_cases:
        if i[1] != 0 and i[1] > max_case_value:
            max_case_value = i[1]
            case_detected = i[0]

    if max_case_value != 0:
        return case_detected
    else:
        return "Sorry, We Couldn't Detect"

