import 'package:flutter/material.dart';

// ignore: camel_case_types
class Custom_Line {
  // ignore: non_constant_identifier_names
  color_line_H(Color inColor, double inTickness) {
    return Container(
      color: inColor,
      height: inTickness,
    );
  }

  // ignore: non_constant_identifier_names
  color_line_W(Color inColor, double inTickness) {
    return Container(
      color: inColor,
      width: inTickness,
    );
  }
  
  // ignore: non_constant_identifier_names
  line_H(double inTickness) {
    return Container(
      color: Colors.black,
      height: inTickness,
    );
  }

  // ignore: non_constant_identifier_names
  line_W(double inTickness) {
    return Container(
      color: Colors.black,
      width: inTickness,
    );
  }
}