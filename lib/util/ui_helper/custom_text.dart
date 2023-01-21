import 'package:flutter/material.dart';

// ignore: camel_case_types
class Custom_Text {
  weightText(String inText, double inSize, FontWeight inWeight) {
    return Text(
      inText,
      style: TextStyle(
        fontSize: inSize,
        fontWeight: inWeight,
      ),
    );
  }

  text(String inText, double inSize) {
    return Text(
      inText,
      style: TextStyle(
        fontSize: inSize,
      ),
    );
  }
}
