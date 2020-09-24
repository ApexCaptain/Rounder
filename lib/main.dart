import 'package:flutter/material.dart';
import 'package:rounder/views/auth/biometric_view.dart';
import 'package:flutter/services.dart';
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
        body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                  child: Text("Click"),
                  onPressed: () {


                  },
                )
              ],
          ),
        ),
      )
    );
  }


}