import 'package:flutter/material.dart';

class tips extends StatelessWidget {
  const tips({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Regular grooming tips'),
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
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            SizedBox(height: 20, width: 10),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    width: 180,
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.green, width: 3)),
                    child: Column(
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.pets_sharp,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        Text(
                          "Brush Your Cat Every Day",
                          style: TextStyle(
                            fontSize: 24,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    )),
                SizedBox(
                  height: 10,
                  width: 15,
                ),
                Container(
                  width: 180,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.green, width: 3)),
                  child: Column(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.pets_sharp,
                          ),
                        ],
                      ),
                      Text(
                        "Don’t Feed Your Cat Too Much Dry Food",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            SizedBox(height: 20, width: 10),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    width: 180,
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.green, width: 3)),
                    child: Column(
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.pets_sharp,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        Text(
                          "Pay Attention to Your Pet’s Thirst",
                          style: TextStyle(
                            fontSize: 24,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    )),
                SizedBox(
                  height: 10,
                  width: 15,
                ),
                Container(
                  width: 180,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.green, width: 3)),
                  child: Column(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.pets_sharp,
                          ),
                        ],
                      ),
                      Text(
                        "Provide a Sufficient Number of Litter Boxes",
                        style: TextStyle(
                          fontSize: 22,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            SizedBox(height: 20, width: 10),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    width: 180,
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.green, width: 3)),
                    child: Column(
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.pets_sharp,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        Text(
                          "Spay or Neuter Your Cat",
                          style: TextStyle(
                            fontSize: 24,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    )),
                SizedBox(
                  height: 10,
                  width: 15,
                ),
                Container(
                  width: 180,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.green, width: 3)),
                  child: Column(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.pets_sharp,
                          ),
                        ],
                      ),
                      Text(
                        "Don't Assume You Know Why a Cat Is Peeing Outside the Box",
                        style: TextStyle(fontSize: 22),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            SizedBox(height: 20, width: 10),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    width: 180,
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.green, width: 3)),
                    child: Column(
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.pets_sharp,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        Text(
                          "Travel Safely With Your Pet",
                          style: TextStyle(fontSize: 25),
                        )
                      ],
                    )),
                SizedBox(
                  height: 10,
                  width: 15,
                ),
                Container(
                  width: 180,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.green, width: 3)),
                  child: Column(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.pets_sharp,
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                      Text(
                        "Choose a Cat-Friendly Vet",
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Go back!'),
                )),
          ],
        )));
  }
}
