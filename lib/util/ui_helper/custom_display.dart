import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: camel_case_types
class Custom_Display {
  // ignore: non_constant_identifier_names
  divider_H(double inHeight) {
    return SizedBox(
      height: inHeight,
    );
  }

  // ignore: non_constant_identifier_names
  divider_W(double inWidth) {
    return SizedBox(
      width: inWidth,
    );
  }

  toast(String inMessage) {
    return Fluttertoast.showToast(msg: inMessage, gravity: ToastGravity.CENTER);
  }

  dialog(BuildContext inContext, double inWidth, double inHeight,
      {Widget inTitle = const SizedBox(), Widget inBody = const SizedBox()}) {
    return showDialog(
        context: inContext,
        builder: (BuildContext outContext) {
          return Center(
            child: Container(
              width: inWidth,
              height: inHeight,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              child: Column(
                children: [
                  inTitle,
                  Expanded(
                    child: inBody,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
