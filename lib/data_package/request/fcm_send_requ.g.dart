// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fcm_send_requ.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FCMSendREQU_notification _$FCMSendREQU_notificationFromJson(
        Map<String, dynamic> json) =>
    FCMSendREQU_notification(
      title: json['title'] as String?,
      body: json['body'] as String?,
      content_available: json['content_available'] as bool? ?? true,
      mutable_content: json['mutable_content'] as bool? ?? true,
    );

Map<String, dynamic> _$FCMSendREQU_notificationToJson(
        FCMSendREQU_notification instance) =>
    <String, dynamic>{
      'body': instance.body,
      'title': instance.title,
      'content_available': instance.content_available,
      'mutable_content': instance.mutable_content,
    };

FCMSendREQU _$FCMSendREQUFromJson(Map<String, dynamic> json) => FCMSendREQU(
      to: json['to'] as String?,
      notification: FCMSendREQU_notification.fromJson(
          json['notification'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FCMSendREQUToJson(FCMSendREQU instance) =>
    <String, dynamic>{
      'to': instance.to,
      'notification': instance.notification,
    };
