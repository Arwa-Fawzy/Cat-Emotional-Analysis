from image import *
from video import *


class Button():
    def __init__(self, image, pos, text_input, font, base_color, hovering_color):
        self.image = image
        self.x_pos = pos[0]
        self.y_pos = pos[1]
        self.font = font
        self.base_color, self.hovering_color = base_color, hovering_color
        self.text_input = text_input
        self.text = self.font.render(self.text_input, True, self.base_color)
        if self.image is None:
            self.image = self.text
        self.rect = self.image.get_rect(center=(self.x_pos, self.y_pos))
        self.text_rect = self.text.get_rect(center=(self.x_pos, self.y_pos))

    def update(self, screen):
        if self.image is not None:
            screen.blit(self.image, self.rect)
        screen.blit(self.text, self.text_rect)

    def checkForInput(self, position):
        if position[0] in range(self.rect.left, self.rect.right) and position[1] in range(self.rect.top, self.rect.bottom):
            return True
        return False

    def changeColor(self, position):
        if position[0] in range(self.rect.left, self.rect.right) and position[1] in range(self.rect.top, self.rect.bottom):
            self.text = self.font.render(self.text_input, True, self.hovering_color)
        else:
            self.text = self.font.render(self.text_input, True, self.base_color)

def get_font(size):  # Returns Press-Start-2P in the desired size
    return pygame.font.Font("assets/font.ttf", size)


def Detect():
    image_valid = False
    video_valid = False
    while True:
        Detect_MOUSE_POS = pygame.mouse.get_pos()

        SCREEN.fill("black")

        DETECT_TEXT = get_font(30).render("Hello, Please Import The Photo", True, "White")
        DETECT_RECT = DETECT_TEXT.get_rect(center=(640, 260))
        SCREEN.blit(DETECT_TEXT, DETECT_RECT)
        DETECT_TEXT = get_font(30).render("or video of your cat", True, "White")
        DETECT_RECT = DETECT_TEXT.get_rect(center=(640, 300))
        SCREEN.blit(DETECT_TEXT, DETECT_RECT)
        DETECT_TEXT = get_font(30).render("If you will choose a video and", True, "White")
        DETECT_RECT = DETECT_TEXT.get_rect(center=(640, 340))
        SCREEN.blit(DETECT_TEXT, DETECT_RECT)
        DETECT_TEXT = get_font(30).render("want to stop detect, press 'q'", True, "White")
        DETECT_RECT = DETECT_TEXT.get_rect(center=(640, 380))
        SCREEN.blit(DETECT_TEXT, DETECT_RECT)
        DETECT_IMPORT = Button(image=None, pos=(640, 460),
                           text_input="Import", font=get_font(75), base_color="White", hovering_color="Green")

        DETECT_IMPORT.changeColor(Detect_MOUSE_POS)
        DETECT_IMPORT.update(SCREEN)

        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                pygame.quit()
                sys.exit()
            if event.type == pygame.MOUSEBUTTONDOWN:
                if DETECT_IMPORT.checkForInput(Detect_MOUSE_POS):
                    filename = tkinter.filedialog.askopenfilename()
                    for i in image_lst:
                        if i in filename:
                            image_valid = True
                    if image_valid == True :
                        global detection_of_image
                        detection_of_image = image_detection(filename)
                        time.sleep(5)
                        results_image()
                    if image_valid == False :
                        for i in video_lst:
                            if i in filename:
                                video_valid = True
                        if video_valid == True :
                            global detection_of_video
                            detection_of_video = video_detection(filename)
                            time.sleep(5)
                            results_video()

        pygame.display.update()

def About():
    while True:
        ABOUT_MOUSE_POS = pygame.mouse.get_pos()

        SCREEN.fill("white")

        ABOUT_TEXT = get_font(45).render("This is the About screen.", True, "Black")
        ABOUT_RECT = ABOUT_TEXT.get_rect(center=(640, 260))
        SCREEN.blit(ABOUT_TEXT, ABOUT_RECT)

        ABOUT_BACK = Button(image=None, pos=(640, 460),
                              text_input="BACK", font=get_font(75), base_color="Black", hovering_color="Green")

        ABOUT_BACK.changeColor(ABOUT_MOUSE_POS)
        ABOUT_BACK.update(SCREEN)

        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                pygame.quit()
                sys.exit()
            if event.type == pygame.MOUSEBUTTONDOWN:
                if ABOUT_BACK.checkForInput(ABOUT_MOUSE_POS):
                    main_menu()

        pygame.display.update()
def main_menu():
    if os.path.exists("image_detection.png"):
        os.remove("image_detection.png")
    if os.path.exists("tail_detection.png"):
        os.remove("tail_detection.png")
    if os.path.exists("eye_detection.png"):
        os.remove("eye_detection.png")
    image_valid = False
    video_valid = False
    all = False
    image_only = False
    image_Tail = False
    image_eye = False
    while True:
        SCREEN.blit(BG, (0, 0))

        MENU_MOUSE_POS = pygame.mouse.get_pos()

        MENU_TEXT = get_font(100).render("MAIN MENU", True, "#b68f40")
        MENU_RECT = MENU_TEXT.get_rect(center=(640, 100))

        DETECT_BUTTON = Button(image=pygame.image.load("assets/Options Rect.png"), pos=(640, 250),
                             text_input="Detect", font=get_font(75), base_color="#d7fcd4", hovering_color="White")
        ABOUT_BUTTON = Button(image=pygame.image.load("assets/Options Rect.png"), pos=(640, 400),
                                text_input="ABOUT", font=get_font(75), base_color="#d7fcd4", hovering_color="White")
        QUIT_BUTTON = Button(image=pygame.image.load("assets/Options Rect.png"), pos=(640, 550),
                             text_input="QUIT", font=get_font(75), base_color="#d7fcd4", hovering_color="White")

        SCREEN.blit(MENU_TEXT, MENU_RECT)

        for button in [DETECT_BUTTON, ABOUT_BUTTON, QUIT_BUTTON]:
            button.changeColor(MENU_MOUSE_POS)
            button.update(SCREEN)

        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                pygame.quit()
                sys.exit()
            if event.type == pygame.MOUSEBUTTONDOWN:
                if DETECT_BUTTON.checkForInput(MENU_MOUSE_POS):
                    Detect()
                if ABOUT_BUTTON.checkForInput(MENU_MOUSE_POS):
                    About()
                if QUIT_BUTTON.checkForInput(MENU_MOUSE_POS):
                    pygame.quit()
                    sys.exit()

        pygame.display.update()


def results_image():
    all = False
    image_only = False
    image_Tail = False
    image_eye = False
    if os.path.exists("image_detection.png") and os.path.exists("tail_detection.png") and os.path.exists("eye_detection.png"):
        image_background = pygame.image.load("image_detection.png").convert_alpha()
        image_background = pygame.transform.scale(image_background, (1280, 360))
        tail_background = pygame.image.load("tail_detection.png").convert_alpha()
        tail_background = pygame.transform.scale(tail_background, (640, 360))
        eye_background = pygame.image.load("eye_detection.png").convert_alpha()
        eye_background = pygame.transform.scale(eye_background, (640, 360))
        all = True

    elif os.path.exists("image_detection.png") and os.path.exists("tail_detection.png"):
        image_background = pygame.image.load("image_detection.png").convert_alpha()
        image_background = pygame.transform.scale(image_background, (1280, 360))
        tail_background = pygame.image.load("tail_detection.png").convert_alpha()
        tail_background = pygame.transform.scale(tail_background, (1280, 360))
        image_Tail = True

    elif os.path.exists("image_detection.png") and os.path.exists("eye_detection.png"):
        image_background = pygame.image.load("image_detection.png").convert_alpha()
        image_background = pygame.transform.scale(image_background, (1280, 360))
        eye_background = pygame.image.load("eye_detection.png").convert_alpha()
        eye_background = pygame.transform.scale(eye_background, (1280, 360))
        image_eye  = True
    elif os.path.exists("image_detection.png"):
        image_background = pygame.image.load("image_detection.png").convert_alpha()
        image_background = pygame.transform.scale(image_background, (1280, 720))
        image_only = True
    while True:
        SCREEN.fill("white")
        PHOTO_MOUSE_POS = pygame.mouse.get_pos()
        if all == True:
            SCREEN.blit(image_background, (0,0))
            SCREEN.blit(tail_background, (0, 360))
            SCREEN.blit(eye_background, (640,360))

        elif image_Tail == True:
            SCREEN.blit(image_background, (0, 0))
            SCREEN.blit(tail_background, (0, 360))

        elif image_eye == True:
            SCREEN.blit(image_background, (0, 0))
            SCREEN.blit(eye_background, (0, 360))

        elif image_only == True:
            SCREEN.blit(image_background, (0, 0))
        Cont_button = Button(image=None, pos=(640, 600),text_input="Continue", font=get_font(30), base_color="Black", hovering_color="Green")
        Cont_button.changeColor(PHOTO_MOUSE_POS)
        Cont_button.update(SCREEN)
        for event in pygame.event.get():
            if event.type == pygame.MOUSEBUTTONDOWN:
                if Cont_button.checkForInput(PHOTO_MOUSE_POS):
                    Continue()
        pygame.display.update()


def Continue():
    while True:
        Continue_MOUSE_POS = pygame.mouse.get_pos()

        SCREEN.fill("white")

        Continue_TEXT = get_font(25).render("Your cat is", True, "Black")
        Continue_RECT = Continue_TEXT.get_rect(center=(640, 260))
        SCREEN.blit(Continue_TEXT, Continue_RECT)
        Continue_TEXT = get_font(25).render(f"{detection_of_image}", True, "Black")
        Continue_RECT = Continue_TEXT.get_rect(center=(640, 300))
        SCREEN.blit(Continue_TEXT, Continue_RECT)
        Continue_BACK = Button(image=None, pos=(640, 460),
                              text_input="Back", font=get_font(75), base_color="Black", hovering_color="Green")

        Continue_BACK.changeColor(Continue_MOUSE_POS)
        Continue_BACK.update(SCREEN)

        for event in pygame.event.get():

            if event.type == pygame.MOUSEBUTTONDOWN:
                if Continue_BACK.checkForInput(Continue_MOUSE_POS):
                    main_menu()
        pygame.display.update()

def results_video():
    while True:
        VIDEO_MOUSE_POS = pygame.mouse.get_pos()

        SCREEN.fill("white")

        VIDEO_TEXT = get_font(25).render(f"Your cat is", True, "Black")
        VIDEO_RECT = VIDEO_TEXT.get_rect(center=(640, 260))
        SCREEN.blit(VIDEO_TEXT, VIDEO_RECT)
        VIDEO_TEXT = get_font(25).render(f"{detection_of_video}", True, "Black")
        VIDEO_RECT = VIDEO_TEXT.get_rect(center=(640, 300))
        SCREEN.blit(VIDEO_TEXT, VIDEO_RECT)
        VIDEO_BACK = Button(image=None, pos=(640, 460),
                               text_input="BACK", font=get_font(75), base_color="Black", hovering_color="Green")

        VIDEO_BACK.changeColor(VIDEO_MOUSE_POS)
        VIDEO_BACK.update(SCREEN)

        for event in pygame.event.get():

            if event.type == pygame.MOUSEBUTTONDOWN:
                if VIDEO_BACK.checkForInput(VIDEO_MOUSE_POS):
                    main_menu()

        pygame.display.update()
