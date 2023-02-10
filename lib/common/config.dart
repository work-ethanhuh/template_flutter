class DefinedAPI {
  static const PUBLIC_DATA_PORTAL = "http://api.odcloud.kr/api";
  static const FCM =
      "https://fcm.googleapis.com/v1/projects/template-flutter-27e96";
}

class SPKey {
  static const FCM_KEY = "fcm_key";
}

class ReceivedNotification {
  ReceivedNotification(
      {required this.id,
      required this.title,
      required this.body,
      required this.payload});

  final int id;
  final String? title;
  final String? body;
  final String? payload;
}
