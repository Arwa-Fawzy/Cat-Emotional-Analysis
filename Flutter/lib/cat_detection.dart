import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class catDetection extends StatefulWidget {
  const catDetection({super.key});

  @override
  State<catDetection> createState() => _catDetectionState();
}

class _catDetectionState extends State<catDetection> {
  File? imageFile;

  String detecionResult = '';

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat Detection With Camera'),
      ),
      body: Center(
          child: ListView(
        children: [
          imageFile == null
              ? Text('')
              : Container(
                  child: Image.file(
                    imageFile!,
                    fit: BoxFit.cover,
                  ),
                ),
          Align(
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () async {
                PickedFile? pickedFile = await ImagePicker().getImage(
                    source: ImageSource.gallery,
                    maxWidth: 1800,
                    maxHeight: 1800);

                if (pickedFile != null) {
                  setState(() {
                    imageFile = File(pickedFile.path);
                  });
                }
              },
              child: Text(
                "Pick an image",
                style: TextStyle(
                    color: Color.fromARGB(255, 53, 119, 56), fontSize: 24),
              ),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 68, 148, 71)),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                          side: BorderSide(
                              color: Color.fromARGB(255, 53, 119, 56),
                              width: 3)))),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () async {
                if (imageFile == null) {
                  setState(() {
                    detecionResult = 'Please pick an image';
                  });
                } else {
                  final request = http.MultipartRequest(
                      'POST', Uri.parse("http://10.0.2.2:1234/upload"));

                  final headers = {"Content-type": "multipart/form-data"};

                  request.files.add(http.MultipartFile(
                      'image',
                      imageFile!.readAsBytes().asStream(),
                      imageFile!.lengthSync(),
                      filename: imageFile!.path.split("/").last));

                  request.headers.addAll(headers);
                  final response = await request.send();
                  http.Response res = await http.Response.fromStream(response);
                  final resJson = jsonDecode(res.body);
                  detecionResult = resJson["result"];
                  setState(() {});
                }
              },
              child: Text(
                "Detect",
                style: TextStyle(
                    color: Color.fromARGB(255, 53, 119, 56), fontSize: 24),
              ),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 68, 148, 71)),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                          side: BorderSide(
                              color: Color.fromARGB(255, 53, 119, 56),
                              width: 3)))),
            ),
          ),
          Text(
            detecionResult,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromARGB(255, 53, 119, 56), fontSize: 24),
          ),
        ],
      )),
    );
  }
}
