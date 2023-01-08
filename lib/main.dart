import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template_flutter/common/cv.dart';
import 'package:template_flutter/common/routes.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CV(),),
      ],
      child: MaterialApp.router(
        routerConfig: routes,
      ),
    )
  );
}