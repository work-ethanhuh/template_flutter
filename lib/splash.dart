import 'dart:async';

import 'package:flutter/material.dart';
import 'package:template_flutter/login.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

class SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 3000), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      // ignore: prefer_const_constructors
      child: Scaffold(
        // ignore: prefer_const_constructors
        body: Center(
          child: Text('스플레시'),
        ),
      ),
    );
  }
}
