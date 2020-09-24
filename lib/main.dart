import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

void main() async {
  runApp(RounderApplication());
}

class RounderApplication extends StatefulWidget {
  @override
  _RounderApplicationState createState() => _RounderApplicationState();
}

class _RounderApplicationState extends State<RounderApplication> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Example"),
        ),
        body: Container(),
      ),
    );
  }
}
