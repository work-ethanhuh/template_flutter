import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:template_flutter/api/fixed_key.dart';
import 'package:template_flutter/common/config.dart';
import 'package:template_flutter/util/util_helper.dart';

abstract class BasicClient {
  static final basic = Dio()
    ..interceptors.add(InterceptorsWrapper(
        onRequest: onRequestInterceptor,
        onResponse: onResponseInterceptor,
        onError: onErrorInterceptor));
  static final publicPortal = Dio()
    ..interceptors.add(InterceptorsWrapper(
        onRequest: onRequestPublicPortalInterceptor,
        onResponse: onResponseInterceptor,
        onError: onErrorInterceptor));
  static final FCM = Dio()
    ..interceptors.add(InterceptorsWrapper(
        onRequest: onRequestFCMInterceptor,
        onResponse: onResponseInterceptor,
        onError: onErrorInterceptor));

  static dynamic innerParser(dynamic data) {
    try {
      if (data != null) {
        return data.toString();
      } else {
        if (data is List) {
          print(data.runtimeType);
          final dynamicList = [];
          for (var iterator = 0; iterator < data.length; iterator++) {
            dynamicList.add(innerParser(data[iterator]));
          }
          return dynamicList;
        }
      }

      if (data is Map) {
        for (var key in data.keys) {
          data[key] = innerParser(data[key]);
        }
      }

      if (data is int) return data;
      if (data is double) return data;

      return data;
    } catch (e) {
      print('Pasing Error----------------------------------------------!!!');
      print('$e');
    }
  }

  static void onRequestInterceptor(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print('Request API----------------------------------------------Begin!!!');
    print('path         : ${options.baseUrl}${options.path}');
    print('body         : ${innerParser(options.data)}');
    print('query        : ${innerParser(options.queryParameters)}');
    print('header       : ${options.headers}');
    print('Request API----------------------------------------------End  !!!');
    return handler.next(options);
  }

  static void onRequestPublicPortalInterceptor(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.queryParameters['serviceKey'] = FIXEDKEY.PUBLIC_DATA_PORTAL;
    options.queryParameters['returnType'] = 'JSON';
    print('Request API----------------------------------------------Begin!!!');
    print('path         : ${options.baseUrl}${options.path}');
    print('body         : ${innerParser(options.data)}');
    print('query        : ${innerParser(options.queryParameters)}');
    print('header       : ${options.headers}');
    print('Request API----------------------------------------------End  !!!');
    return handler.next(options);
  }

  static void onRequestFCMInterceptor(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? fcmKey = await UTH().getString(SPKey.FCM_KEY);
    options.headers['Authorization'] = 'Bearer $fcmKey';
    print('Request API----------------------------------------------Begin!!!');
    print('path         : ${options.baseUrl}${options.path}');
    print('body         : ${innerParser(options.data)}');
    print('query        : ${innerParser(options.queryParameters)}');
    print('header       : ${options.headers}');
    print('Request API----------------------------------------------End  !!!');
    return handler.next(options);
  }

  static void onResponseInterceptor(
      Response response, ResponseInterceptorHandler handler) async {
    print('Response From API----------------------------------------Begin!!!');
    if (response is Map) {
      var encording = const JsonEncoder.withIndent(' ');
      String result = encording.convert(response.data);
      print(
          'path         : ${response.requestOptions.baseUrl}${response.requestOptions.path}');
      print('header       : ${response.headers}');
      print('body         : $result');
    } else {
      print(
          'path         : ${response.requestOptions.baseUrl}${response.requestOptions.path}');
      print('header       : ${response.headers}');
      print('body         : ${response.data}');
    }
    print('Response From API----------------------------------------End  !!!');
    return handler.next(response);
  }

  static void onErrorInterceptor(
      DioError error, ErrorInterceptorHandler handler) async {
    if (error == DioErrorType.connectTimeout) {
      print(
          'Dio request Timeout--------------------------------------Begin!!!');
      print('${error.error}');
      print(
          'Dio request Timeout--------------------------------------End  !!!');
    }
    print(
        '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Dio Error!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
    print('Dio request Error----------------------------------------Begin!!!');
    print(
        'path         : ${error.requestOptions.baseUrl}${error.requestOptions.path}');
    print('status code  : ${error.response!.statusCode}');
    print('header       : ${error.response!.headers}');
    print('body         : ${error.response!.data}');
    print('Dio request Error----------------------------------------End  !!!');
    return handler.next(error);
  }
}
