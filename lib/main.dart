import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:template_flutter/common/cv.dart';
import 'package:template_flutter/splash.dart';
import 'firebase_options.dart';

initialFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initialFirebase();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
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
