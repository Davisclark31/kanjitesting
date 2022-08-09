import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:stroke_order_animator/strokeOrderAnimationController.dart';
import 'package:stroke_order_animator/strokeOrderAnimator.dart';
import 'package:flutter/material.dart';
import 'package:kanjiapp/home/home.dart';
import 'package:kanjiapp/training/training.dart';
import 'package:kanjiapp/routes.dart';
import 'package:kanjiapp/theme.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      routes: appRoutes,
      // theme: appTheme,
    );
  }
}
