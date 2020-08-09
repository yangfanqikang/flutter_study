import 'dart:ffi';

import 'package:flutter/material.dart';

import 'LaunchScreen.dart';
// import 'home.dart';
import 'near/navigation/secondPage.dart';
import 'near/navigation/thirdPage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LaunchScreen(),
      routes: {
        '/second': (BuildContext context) {
          return SecondPage(content: '12344');
        },
        '/third': (BuildContext context) {
          return ThirdPage();
        },
      },
    );
  }
}
