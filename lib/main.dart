import 'dart:ffi';

import 'package:flutter/material.dart';

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
      // home: FirstScreen(),
      initialRoute: '/first',
      routes: <String, WidgetBuilder>{
        '/first': (BuildContext context) => FirstScreen(),
        '/second': (BuildContext context) {
          return SecondScreen();
        },
      },
    );
  }
}

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  // ignore: unused_field
  final List<ScreenWidget> _children = [ScreenWidget('闹铃'), ScreenWidget('银行')];
  int _currentIndex = 0;
  void onTapTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('FirstScreen'),
        // leading: Text('leading'),
        // actions: <Widget>[Text('data1'), Text('data2')],
        centerTitle: false,
        // elevation: 10,
      ),
      drawer: new Drawer(
          child: Center(
        child: Text('Drawer'),
      )),
      // body: Center(
      //   child: Text('body'),
      // ),
      body: _children[_currentIndex],
      bottomNavigationBar: new BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: onTapTapped,
          items: [
            new BottomNavigationBarItem(
                icon: Icon(Icons.access_alarm), title: Text('闹钟')),
            new BottomNavigationBarItem(
                icon: Icon(Icons.account_balance), title: Text('银行'))
          ]),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text('SecondScreen'),
        ),
        body: Center(
          child: Text('body11'),
        ));
  }
}

class ScreenWidget extends StatelessWidget {
  final String text;

  ScreenWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text),
    );
  }
}
