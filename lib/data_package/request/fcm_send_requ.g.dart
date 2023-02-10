// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fcm_send_requ.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FCMSendREQU_apns_payload_aps _$FCMSendREQU_apns_payload_apsFromJson(
        Map<String, dynamic> json) =>
    FCMSendREQU_apns_payload_aps(
      mutable_content: json['mutable_content'] as int?,
      content_available: json['content_available'] as int?,
    );

Map<String, dynamic> _$FCMSendREQU_apns_payload_apsToJson(
        FCMSendREQU_apns_payload_aps instance) =>
    <String, dynamic>{
      'mutable_content': instance.mutable_content,
      'content_available': instance.content_available,
    };

FCMSendREQU_apns_payload _$FCMSendREQU_apns_payloadFromJson(
        Map<String, dynamic> json) =>
    FCMSendREQU_apns_payload(
      aps: FCMSendREQU_apns_payload_aps.fromJson(
          json['aps'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FCMSendREQU_apns_payloadToJson(
        FCMSendREQU_apns_payload instance) =>
    <String, dynamic>{
      'aps': instance.aps,
    };

FCMSendREQU_apns _$FCMSendREQU_apnsFromJson(Map<String, dynamic> json) =>
    FCMSendREQU_apns(
      payload: FCMSendREQU_apns_payload.fromJson(
          json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FCMSendREQU_apnsToJson(FCMSendREQU_apns instance) =>
    <String, dynamic>{
      'payload': instance.payload,
    };

FCMSendREQU_message_notification _$FCMSendREQU_message_notificationFromJson(
        Map<String, dynamic> json) =>
    FCMSendREQU_message_notification(
      title: json['title'] as String?,
      body: json['body'] as String?,
    );

Map<String, dynamic> _$FCMSendREQU_message_notificationToJson(
        FCMSendREQU_message_notification instance) =>
    <String, dynamic>{
      'body': instance.body,
      'title': instance.title,
    };

FCMSendREQU_message _$FCMSendREQU_messageFromJson(Map<String, dynamic> json) =>
    FCMSendREQU_message(
      token: json['token'] as String?,
      notification: FCMSendREQU_message_notification.fromJson(
          json['notification'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FCMSendREQU_messageToJson(
        FCMSendREQU_message instance) =>
    <String, dynamic>{
      'token': instance.token,
      'notification': instance.notification,
    };

FCMSendREQU_AOS _$FCMSendREQU_AOSFromJson(Map<String, dynamic> json) =>
    FCMSendREQU_AOS(
      message:
          FCMSendREQU_message.fromJson(json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FCMSendREQU_AOSToJson(FCMSendREQU_AOS instance) =>
    <String, dynamic>{
      'message': instance.message,
    };

FCMSendREQU_IOS _$FCMSendREQU_IOSFromJson(Map<String, dynamic> json) =>
    FCMSendREQU_IOS(
      message:
          FCMSendREQU_message.fromJson(json['message'] as Map<String, dynamic>),
      apns: FCMSendREQU_apns.fromJson(json['apns'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FCMSendREQU_IOSToJson(FCMSendREQU_IOS instance) =>
    <String, dynamic>{
      'message': instance.message,
      'apns': instance.apns,
    };
