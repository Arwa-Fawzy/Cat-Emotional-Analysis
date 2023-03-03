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
          child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: 10,
              right: 100,
            ),
          ),
          SizedBox(
            height: 100,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Go back!'),
          ),
        ],
      )),
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
