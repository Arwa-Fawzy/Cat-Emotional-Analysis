import werkzeug

from image import *
from video import *
from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/upload', methods=["POST"])
def upload():
    if(request.method == "POST"):
        imagefile = request.files["image"]
        filename = werkzeug.utils.secure_filename(imagefile. filename)
        catPath = "./uploadedimages/" + filename
        imagefile.save(catPath)
        prediction = image_detection(catPath)
        print(prediction)
        return jsonify({"result": prediction})


if __name__ == "__main__":
    app.run(port=1234)
