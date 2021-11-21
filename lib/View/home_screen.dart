import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:showcaseview/showcaseview.dart';

import 'books_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShowCaseWidget(
        onStart: (index, key) {
          log('onStart: $index, $key');
        },
        onComplete: (index, key) {
          log('onComplete: $index, $key');
          if (index == 4) {
            SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
                .copyWith(
                statusBarIconBrightness: Brightness.dark,
                statusBarColor: Colors.white));
          }
        },
        builder: Builder(builder: (context) => MailPage()),
        autoPlay: false,
        autoPlayDelay: const Duration(seconds: 3),
        autoPlayLockEnable: false,
      ),
    );
  }
}
