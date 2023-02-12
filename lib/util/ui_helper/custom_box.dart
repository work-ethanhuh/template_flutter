// ignore: camel_case_types
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Custom_Box {
  roundedPadding(
      Widget inWidget, double inWidth, double inHeight, double inPadding) {
    return Container(
      padding: EdgeInsets.all(inPadding),
      child: Container(
        // ignore: prefer_const_constructors
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        width: inWidth,
        height: inHeight,
        child: inWidget,
      ),
    );
  }

  rounded_H(Widget inWidget, double inWidth, double inHeight) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        // ignore: prefer_const_constructors
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        width: inWidth,
        height: inHeight,
        child: inWidget,
      ),
    );
  }

  rounded(Widget inWidget, double inWidth) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        // ignore: prefer_const_constructors
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        width: inWidth,
        child: inWidget,
      ),
    );
  }

  box_H(Widget inWidget, double inWidth, double inHeight) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        width: inWidth,
        height: inHeight,
        child: inWidget,
      ),
    );
  }

  box(Widget inWidget, double inWidth) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        width: inWidth,
        child: inWidget,
      ),
    );
  }
}
