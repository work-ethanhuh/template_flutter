import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:template_flutter/common/config.dart';
import 'package:template_flutter/dashboard.dart';
import 'package:template_flutter/login.dart';
import 'package:template_flutter/util/util_helper.dart';

import 'common/cv.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
AndroidNotificationChannel channel = const AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description:
      'This channel is used for important notifications.', // description
  importance: Importance.high,
);

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
  print("Handling a background message: ${message.data}");
  print('Message title : ${message.notification!.title}');
  print('Message body  : ${message.notification!.body}');
  ReceivedNotification rn = ReceivedNotification(
      title: message.notification!.title, body: message.notification!.body);
  if (!Platform.isAndroid) {
    showFlutterNotification(message);
  }
}

void showFlutterNotification(RemoteMessage message) {
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  if (notification != null && android != null) {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          // TODO add a proper drawable resource to android, for now using
          //      one that already exists in example app.
          icon: '@mipmap/launcher_icon',
        ),
      ),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

class SplashState extends State<Splash> {
  bool autoLoginCheck = false;
  bool goDirection = false;
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 3000), () {
      initSequence();
      FirebaseAuth.instance.authStateChanges().listen((event) {
        autoLoginCheck = true;
        if (event != null) {
          setState(() {
            goDirection = true;
          });
          Timer(const Duration(milliseconds: 1000), () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => DashBoard()));
          });
        } else {
          setState(() {
            goDirection = false;
          });
          Timer(const Duration(milliseconds: 1000), () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Login()));
          });
        }
      });
    });
  }

  initSequence() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      FirebaseMessaging.onBackgroundMessage(
          _firebaseMessagingBackgroundHandler);
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);
      await FirebaseMessaging.instance.setAutoInitEnabled(true);
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print('Got a message whilst in the foreground!');
        print('Message data: ${message.data}');

        if (message.notification != null) {
          print(
              'Message also contained a notification: ${message.notification}');
          print('Message title : ${message.notification!.title}');
          print('Message body  : ${message.notification!.body}');
          ReceivedNotification rn = ReceivedNotification(
              title: message.notification!.title,
              body: message.notification!.body);
          Provider.of<CV>(context, listen: false).list_FCM.add(rn);
          showFlutterNotification(message);
        }
      });
      await FirebaseMessaging.instance.getToken().then((v) {
        print('FCM-Token : $v');
        Provider.of<CV>(context, listen: false).FCM_Token = v.toString();
        UTH().setString(SPKey.FCM_KEY, v.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      // ignore: prefer_const_constructors
      child: Scaffold(
        // ignore: prefer_const_constructors
        body: Center(
          child: Text(goDirection
              ? 'Complete : Go to Dashboard'
              : autoLoginCheck
                  ? 'Not Login : Go to Login Process'
                  : 'Checking Automatic Login '),
        ),
      ),
    );
  }
}
