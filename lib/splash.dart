import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template_flutter/login.dart';

import 'common/cv.dart';

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
    initSequence();
    Timer(const Duration(milliseconds: 3000), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    });
  }

  initSequence() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await FirebaseMessaging.instance.getToken().then((v) {
        print('FCM-Token : $v');
        Provider.of<CV>(context, listen: false).FCM_Token = v.toString();
      });
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
