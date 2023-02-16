class DefinedAPI {
  static const PUBLIC_DATA_PORTAL = "http://api.odcloud.kr/api";
  static const FCM = "https://fcm.googleapis.com";
  static const PUBLIC_JUSO = "https://www.juso.go.kr/addrlink/addrLinkApi.do";
}

class SPKey {
  static const FCM_KEY = "fcm_key";
}

class ReceivedNotification {
  ReceivedNotification({required this.title, required this.body});

  final String? title;
  final String? body;
}
