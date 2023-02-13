import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:template_flutter/dashboard.dart';
import 'package:template_flutter/util/ui_helper.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<Login> {
  double currentWidth = 0;
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
    currentWidth = MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    if (currentWidth == 0) {
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
                UIH().cBox.box_H(
                    UIH().cTex.weightText('Login', 40, FontWeight.w400),
                    currentWidth,
                    100),
                UIH().cDis.divider_H(70.0),
                if (Platform.isAndroid)
                  InkWell(
                    onTap: () {
                      googleLogin().then((v) {
                        print(v);
                        if (v != null) {
                          print('Google Login Success!!!!');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DashBoard()));
                        } else {
                          print('Google Login Fail!!!!');
                        }
                      });
                    },
                    child: UIH().cBox.rounded_H(
                        UIH().cTex.text('Google', 10), currentWidth, 40),
                  ),
                if (Platform.isIOS)
                  InkWell(
                    onTap: () {
                      appleLogin().then((v) {
                        print(v);
                        if (v != null) {
                          print('Apple Login Success!!!!');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DashBoard()));
                        } else {
                          print('Apple Login Fail!!!!');
                        }
                      });
                    },
                    child: UIH().cBox.rounded_H(
                        UIH().cTex.text('Apple', 10), currentWidth, 40),
                  ),
                UIH().cDis.divider_H(30.0),
              ],
            ),
          ),
        ),
      );
    }
  }

  Future googleLogin() async {
    final GoogleSignInAccount? googleSignInAccount =
        await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleSignInAccount!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future appleLogin() async {
    final appleCredentail = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
      ],
    );
    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredentail.identityToken,
      accessToken: appleCredentail.authorizationCode,
    );
    return await FirebaseAuth.instance.signInWithCredential(oauthCredential);
  }

  loginSequence() {}
}
