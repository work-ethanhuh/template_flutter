import 'package:flutter/material.dart';

// ignore: camel_case_types
class Custom_Text {
  textWeight(String inText, Color inColor, double inSize, FontWeight in_Weight){
    return Text(
      inText,
      style: TextStyle(
        color: inColor,
        fontSize: inSize,
        fontWeight: in_Weight,
      ),
    );
  }
  
  text(String inText, double inSize){
    return Text(
      inText,
      style: TextStyle(
        fontSize: inSize,
      ),
    );
  }
}