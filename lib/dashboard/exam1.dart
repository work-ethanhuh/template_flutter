import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:template_flutter/login.dart';
import 'package:template_flutter/util/ui_helper.dart';

// ignore: use_key_in_widget_constructors
class Exam1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Exam1State();
  }
}

class Exam1State extends State<Exam1> {
  var login_info;
  double currentWidth = 0;

  @override
  void initState() {
    super.initState();
    login_info = FirebaseAuth.instance.currentUser;
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    currentWidth = MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              UIH().cBox.box_H(
                  UIH()
                      .cTex
                      .weightText('Login Infomation', 20, FontWeight.w400),
                  currentWidth,
                  60),
              UIH().cBox.box(UIH().cTex.text('$login_info', 10), currentWidth),
              UIH().cDis.divider_H(30),
              InkWell(
                onTap: () {
                  FirebaseAuth.instance.signOut().then((v) {
                    GoogleSignIn().signOut().then((v1) {
                      print('Logout Success!!!!');
                      Navigator.pop(context);
                    });
                  });
                },
                child: UIH().cBox.rounded_H(
                    UIH().cTex.colorText('Logout', 20, Colors.white),
                    currentWidth,
                    40),
              ),
            ],
          ),
        ),
      ),
    );
  }

  logout() {}
}
