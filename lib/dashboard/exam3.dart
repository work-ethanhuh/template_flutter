import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template_flutter/common/cv.dart';
import 'package:template_flutter/util/ui_helper.dart';

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
      body: SafeArea(
        child: Column(
          children: [
            UIH().cTex.weightText('FCM-Token Test', 20, FontWeight.w400),
            Text('${context.read<CV>().FCM_Token}'),
          ],
        ),
      ),
    );
  }
}
