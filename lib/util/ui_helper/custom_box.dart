// ignore: camel_case_types
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Custom_Box {
  rounded(Widget inWidget) {
    return Container(
      // ignore: prefer_const_constructors
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      ),
      child: inWidget,
    );
  }

  box(Widget inWidget) {
    return Container(
      padding: const EdgeInsets.all(10),
    );
  }
}