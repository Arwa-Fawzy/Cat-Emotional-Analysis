import 'package:flutter/material.dart';
import 'package:cat/sign in.dart';
import 'package:cat/Cat feelings.dart';
import 'package:cat/tips.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 5)),
            Image.asset(
              'assets/images/luck.jpg',
            ),
            Container(
                padding:
                    EdgeInsets.only(top: 40, bottom: 30, left: 10, right: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                        child: Icon(
                      Icons.pets,
                      color: Colors.black,
                      size: 34,
                    )),
                    Text(
                      "Cat Dictionary",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                )),
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
                    onPressed: () => null,
                    child: Text(
                      "Live detection with camera",
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
