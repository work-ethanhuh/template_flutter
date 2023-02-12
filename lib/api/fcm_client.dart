import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:template_flutter/common/config.dart';
import 'package:template_flutter/data_package/request/fcm_send_requ.dart';

part 'fcm_client.g.dart';

@RestApi(baseUrl: DefinedAPI.FCM)
abstract class FCMClient {
  factory FCMClient(Dio FCM, {String baseUrl}) = _FCMClient;

  @POST('/fcm/send')
  Future<dynamic> sendPushMessage(@Body() FCMSendREQU body);
}
