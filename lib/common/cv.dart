import 'package:flutter/material.dart';

class CV with ChangeNotifier {
  bool _check = false;
 
  bool get check => this._check;
  set check(bool value) => this._check = value;
}