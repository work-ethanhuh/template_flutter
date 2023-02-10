import 'package:json_annotation/json_annotation.dart';

part 'fcm_send_requ.g.dart';

@JsonSerializable()
class FCMSendREQU_apns_payload_aps {
  int? mutable_content;
  int? content_available;

  FCMSendREQU_apns_payload_aps({
    required this.mutable_content,
    required this.content_available,
  });

  factory FCMSendREQU_apns_payload_aps.fromJson(Map<String, dynamic> json) =>
      _$FCMSendREQU_apns_payload_apsFromJson(json);
  Map<String, dynamic> toJson() => _$FCMSendREQU_apns_payload_apsToJson(this);
}

@JsonSerializable()
class FCMSendREQU_apns_payload {
  FCMSendREQU_apns_payload_aps aps;

  FCMSendREQU_apns_payload({
    required this.aps,
  });

  factory FCMSendREQU_apns_payload.fromJson(Map<String, dynamic> json) =>
      _$FCMSendREQU_apns_payloadFromJson(json);
  Map<String, dynamic> toJson() => _$FCMSendREQU_apns_payloadToJson(this);
}

@JsonSerializable()
class FCMSendREQU_apns {
  FCMSendREQU_apns_payload payload;

  FCMSendREQU_apns({
    required this.payload,
  });

  factory FCMSendREQU_apns.fromJson(Map<String, dynamic> json) =>
      _$FCMSendREQU_apnsFromJson(json);
  Map<String, dynamic> toJson() => _$FCMSendREQU_apnsToJson(this);
}

@JsonSerializable()
class FCMSendREQU_message_notification {
  String? body;
  String? title;

  FCMSendREQU_message_notification({
    required this.title,
    required this.body,
  });

  factory FCMSendREQU_message_notification.fromJson(
          Map<String, dynamic> json) =>
      _$FCMSendREQU_message_notificationFromJson(json);
  Map<String, dynamic> toJson() =>
      _$FCMSendREQU_message_notificationToJson(this);
}

@JsonSerializable()
class FCMSendREQU_message {
  String? token;
  FCMSendREQU_message_notification notification;

  FCMSendREQU_message({
    required this.token,
    required this.notification,
  });

  factory FCMSendREQU_message.fromJson(Map<String, dynamic> json) =>
      _$FCMSendREQU_messageFromJson(json);
  Map<String, dynamic> toJson() => _$FCMSendREQU_messageToJson(this);
}

@JsonSerializable()
class FCMSendREQU_AOS {
  FCMSendREQU_message message;

  FCMSendREQU_AOS({
    required this.message,
  });

  factory FCMSendREQU_AOS.fromJson(Map<String, dynamic> json) =>
      _$FCMSendREQU_AOSFromJson(json);
  Map<String, dynamic> toJson() => _$FCMSendREQU_AOSToJson(this);
}

@JsonSerializable()
class FCMSendREQU_IOS {
  FCMSendREQU_message message;
  FCMSendREQU_apns apns;

  FCMSendREQU_IOS({
    required this.message,
    required this.apns,
  });

  factory FCMSendREQU_IOS.fromJson(Map<String, dynamic> json) =>
      _$FCMSendREQU_IOSFromJson(json);
  Map<String, dynamic> toJson() => _$FCMSendREQU_IOSToJson(this);
}
