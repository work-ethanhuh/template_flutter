import 'package:flutter/material.dart';
import 'package:template_flutter/util/ui_helper.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<Login> {
  double outWidth = 0;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // ignore: todo
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    outWidth = MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    if (outWidth == 0) {
      return Container(
        alignment: Alignment.center,
        // ignore: prefer_const_constructors
        child: CircularProgressIndicator(
          valueColor: const AlwaysStoppedAnimation(Colors.blue),
          strokeWidth: 5.0,
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UIH().cDis.divider_H(10.0),
                UIH().cBox.box(
                    UIH().cTex.weightText('로그인', 40, FontWeight.w400),
                    outWidth,
                    60),
                UIH().cDis.divider_H(70.0),
                InkWell(
                  onTap: () {
                    loginSequence();
                  },
                  child: UIH()
                      .cBox
                      .rounded(UIH().cTex.text('구글', 10), outWidth, 40),
                ),
                UIH().cDis.divider_H(10.0),
                InkWell(
                  onTap: () {
                    loginSequence();
                  },
                  child: UIH()
                      .cBox
                      .rounded(UIH().cTex.text('사과', 10), outWidth, 40),
                ),
                UIH().cDis.divider_H(10.0),
                InkWell(
                  onTap: () {
                    loginSequence();
                  },
                  child: UIH()
                      .cBox
                      .rounded(UIH().cTex.text('카카', 10), outWidth, 40),
                ),
                UIH().cDis.divider_H(30.0),
              ],
            ),
          ),
        ),
      );
    }
  }

  checkLoginProvider() {}

  loginSequence() {
    checkLoginProvider();
  }
}
