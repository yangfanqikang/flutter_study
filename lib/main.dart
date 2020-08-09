import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hello_world/provider/company_list.dart';
import 'package:provider/provider.dart';

import 'LaunchScreen.dart';
// import 'home.dart';
import 'near/navigation/secondPage.dart';
import 'near/navigation/thirdPage.dart';

// void main() => runApp(new MyApp());

void main() => runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CompanyListProvider())],
      child: MyApp(),
    ));

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
