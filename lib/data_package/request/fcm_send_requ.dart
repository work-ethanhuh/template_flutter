import 'package:json_annotation/json_annotation.dart';

part 'fcm_send_requ.g.dart';

@JsonSerializable()
class FCMSendREQU_notification {
  String? body;
  String? title;
  bool? content_available;
  bool? mutable_content;

  FCMSendREQU_notification({
    required this.title,
    required this.body,
    this.content_available = true,
    this.mutable_content = true,
  });

  factory FCMSendREQU_notification.fromJson(Map<String, dynamic> json) =>
      _$FCMSendREQU_notificationFromJson(json);
  Map<String, dynamic> toJson() => _$FCMSendREQU_notificationToJson(this);
}

@JsonSerializable()
class FCMSendREQU {
  String? to;
  FCMSendREQU_notification notification;

  FCMSendREQU({required this.to, required this.notification});

  factory FCMSendREQU.fromJson(Map<String, dynamic> json) =>
      _$FCMSendREQUFromJson(json);
  Map<String, dynamic> toJson() => _$FCMSendREQUToJson(this);
}
