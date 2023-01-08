import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class Exam3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Exam3State();
  }
}

class Exam3State extends State<Exam3> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exam3'),
      ),
      body: const Center(
        child: Text('Exam3'),
      ),
    );
  }
}