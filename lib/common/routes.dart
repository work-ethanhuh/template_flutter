import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:template_flutter/dashboard.dart';
import 'package:template_flutter/dashboard/exam1.dart';
import 'package:template_flutter/dashboard/exam2.dart';
import 'package:template_flutter/dashboard/exam3.dart';
import 'package:template_flutter/splash.dart';

//---------------------------------------testing now------------//
// Not ready, not apply, just testing now
//---------------------------------------testing now------------//
//---------------------------------------testing now------------//
//---------------------------------------testing now------------//
//---------------------------------------testing now------------//
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter routes = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => Splash(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return child;
      },
      routes: [
        GoRoute(
          path: '/dashboard',
          builder: (context, state) => DashBoard(),
          routes: [
            GoRoute(path: 'exam1', builder: ((context, state) => Exam1())),
            GoRoute(path: 'exam2', builder: ((context, state) => Exam2())),
            GoRoute(path: 'exam3', builder: ((context, state) => Exam3())),
          ],
        ),
      ],
    ),
  ],
);
//---------------------------------------testing now------------//