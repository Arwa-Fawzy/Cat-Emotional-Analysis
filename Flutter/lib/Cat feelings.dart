import 'package:flutter/material.dart';

class catRoute extends StatelessWidget {
  const catRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your cat feelings'),
      ),
      body: Center(
          child: SingleChildScrollView(
              child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
                style: TextStyle(
                  fontSize: 27,
                ),
                textAlign: TextAlign.center,
                "This app will be a turning point for all animals behavior analysis by deep learning."
                "Cat’s tail signals are some of the coolest body language signs that tell the cat's behavior."
                "Moreover, every movement of the tail has a meaning. For instance, the straight-up tails are signals that your cat is feeling friendly or content."
                "The same is for the other parts of the body; the lowered headcat means they are feeling aggressive, inferior or submissive."
                "Furthermore, if the mouth is slightly open and the nose is barely wrinkled, this could be a sign of displeasure or disgust. Cat facial detection, landmark recognition and segmentation process are the keys to highlighting the medical investigation data."
                "To figure this out, we use them to create points on the edge of the part that is assigned to (x, y) coordinates. This detects the increasing or decreasing of distances between every two Cartesian points to predict the shape that will give the exact feeling of cats (if the cat closes slightly her eyes, the distance between the two points decreases)."
                "As each cat has a different-sized landmark, the model compares the distances according to a ratio with respect to the square of landmarks’ recognition."
                "Eventually, this is an application that is a user interface to scan the cat’s behavior through the camera or videos and prints simultaneously the detection result."),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Go back!',
            ),
          ),
        ],
      ))),
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
