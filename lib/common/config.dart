class DefinedAPI {
  static const PUBLIC_DATA_PORTAL = "http://api.odcloud.kr/api";
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
