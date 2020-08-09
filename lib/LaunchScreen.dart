import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hello_world/home.dart';

import 'Application.dart';

class LaunchScreen extends StatefulWidget {
  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  int counter = 5;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = new Timer.periodic(new Duration(seconds: 1), (timer) {
      if (counter == 1) {
        _timer.cancel();
        _timer = null;
        goHomePage();
      } else {
        setState(() {
          counter = --counter;
        });
      }
    });
  }

  goHomePage() {
    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(builder: (BuildContext context) => FlowerApp()),
        (route) => route == null);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Application.screenWidth = size.width;
    Application.screenHeight = size.height;
    Application.statusBarHeight = MediaQuery.of(context).padding.top;
    Application.bottomBarHeight = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.zero,
            child: Image.asset(
              'assets/images/SplashBgImage.jpg',
              height: Application.screenHeight,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: Application.statusBarHeight,
            right: 20,
            child: Chip(
              label: Text('$counter秒'),
              backgroundColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
