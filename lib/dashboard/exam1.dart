import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class Exam1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Exam1State();
  }
}

class Exam1State extends State<Exam1> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exam1'),
      ),
      body: const Center(
        child: Text('Exam1'),
      ),
    );
  }
}