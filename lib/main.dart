import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:template_flutter/common/cv.dart';
import 'package:template_flutter/splash.dart';
import 'package:template_flutter/util/util_helper.dart';
import 'firebase_options.dart';

bool isFlutterLocalNotificationsInitialized = false;

initialFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  UTH().requestPermission();
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  isFlutterLocalNotificationsInitialized = true;
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initialFirebase();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  UTH().loadPrefs();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => CV(),
      ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Splash(),
    ),
  ));
}
