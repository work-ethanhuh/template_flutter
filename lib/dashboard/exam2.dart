import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class Exam2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Exam2State();
  }
}

class Exam2State extends State<Exam2> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: const Center(
        child: Text('Exam2'),
      ),
    );
  }
}