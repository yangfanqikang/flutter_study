import 'package:flutter/material.dart';
import 'package:hello_world/component/Image_task.dart';
// import 'package:hello_world/component/Container_task.dart';
// import 'package:hello_world/component/MutiContainer_task.dart';

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
      home: Scaffold(
        appBar: new AppBar(
          title: Text('常用组件'),
        ),
        body: ImageTask(),
      ),
    );
  }
}
