import 'package:flutter/material.dart';
import 'package:template_flutter/util/ui_helper.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<Login> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            UIH().cBox.box(UIH().cTex.text('로그인', 25)),
            UIH().cDis.divider_H(70.0),
            UIH().cBox.rounded(UIH().cTex.text('구글', 10)),
            UIH().cDis.divider_H(10.0),
            UIH().cBox.rounded(UIH().cTex.text('사과', 10)),
            UIH().cDis.divider_H(10.0),
            UIH().cBox.rounded(UIH().cTex.text('카카', 10)),
            UIH().cDis.divider_H(10.0),
          ],
        ),
      ),
    );
  }
}