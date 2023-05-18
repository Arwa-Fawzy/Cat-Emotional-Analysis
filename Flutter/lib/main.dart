import 'package:cat/cat_detection.dart';
import 'package:flutter/material.dart';
import 'package:cat/sign in.dart';
import 'package:cat/Cat feelings.dart';
import 'package:cat/tips.dart';
import 'package:cat/request.dart';
import 'package:flutter/rendering.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:cat/sign in page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animal Behavior',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const MyHomePage(title: 'HomePage'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String greetings = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          physics: ScrollPhysics(),
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 5)),
            Image.asset(
              'assets/images/luck.jpg',
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                padding: EdgeInsets.only(right: 75),
                child: Text(
                  "Photo's CopyRight is reserved: Luck Movie",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Container(
              padding:
                  EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 80),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 35,
                  ),
                  Icon(
                    Icons.pets,
                    color: Colors.black,
                    size: 34,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "DeepPet",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Acme',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(left: 100)),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      // navigate to sign in page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondRoute()),
                      );
                    },
                    child: Text(
                      "                  Sign In                  ",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 68, 148, 71)),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 65, 143, 68)),
                        shape: MaterialStateProperty
                            .all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                                side: BorderSide(
                                    color: Color.fromARGB(255, 53, 119, 56))))),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const catRoute()),
                      );
                    },
                    child: Text(
                      "   Know Your Cat Feelings  ",
                      style: TextStyle(
                          color: Color.fromARGB(255, 53, 119, 56),
                          fontSize: 24),
                    ),
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 68, 148, 71)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                    side: BorderSide(
                                        color: Color.fromARGB(255, 53, 119, 56),
                                        width: 3)))),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const tips()),
                      );
                    },
                    child: Text(
                      "    Regular grooming tips    ",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 68, 148, 71)),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 65, 143, 68)),
                        shape: MaterialStateProperty
                            .all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                                side: BorderSide(
                                    color: Color.fromARGB(255, 53, 119, 56))))),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const catDetection()),
                      );
                    },
                    child: Text(
                      "Cat detection with camera",
                      style: TextStyle(
                          color: Color.fromARGB(255, 53, 119, 56),
                          fontSize: 24),
                    ),
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 68, 148, 71)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                    side: BorderSide(
                                        color: Color.fromARGB(255, 53, 119, 56),
                                        width: 3)))),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const <Widget>[
                Icon(Icons.home_outlined, color: Colors.black, size: 25.0),
                Icon(Icons.ondemand_video_rounded,
                    color: Colors.black, size: 25.0),
                Icon(Icons.notifications_none_outlined,
                    color: Colors.black, size: 25.0),
                Icon(Icons.list, color: Colors.black, size: 25.0)
              ]),
          color: Colors.white70,
          height: 100),
    );
  }
}
