import 'package:flutter/material.dart';
import 'package:template_flutter/common/config.dart';

class CV with ChangeNotifier {
  String FCM_Token = '';
  bool autoLoginCheck = false;
  List<ReceivedNotification> _list_FCM = [];
  List<ReceivedNotification> get list_FCM => this._list_FCM;
  String searchedAddress = '';
  String searchedDetailAddress = '';
  double searchedLat = 0;
  double searchedLng = 0;

  set list_FCM(List<ReceivedNotification> value) => this._list_FCM = value;
}
