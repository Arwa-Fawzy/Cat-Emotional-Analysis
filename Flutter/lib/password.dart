import 'package:flutter/material.dart';

class password extends StatelessWidget {
  const password({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email request'),
      ),
      body: const MyStatefulWidget(),
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

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => MyCustomFormState();
}

class MyCustomFormState extends State<MyStatefulWidget> {
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 270,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            color: Color.fromARGB(255, 246, 248, 246),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                } else if (RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value) ==
                    false) {
                  return 'Invalid email address';
                }
                return null;
              },
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email address',
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text('Send email'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing the email')),
                    );
                  }
                },
              )),
        ],
      ),
    );
  }
}
