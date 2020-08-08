import 'package:flutter/material.dart';
// import 'package:hello_world/component/Button_task.dart';

// import 'component/Gesture_Task.dart';
// import 'component/GrideView_Task.dart';
// import 'component/SingleChildScrollView_task.dart';
import 'component/Table_Task.dart';
// import 'component/NetWork/FriendScreen.dart';
// import 'component/ListView_task.dart';
// import 'component/NetWork/FriendScreen.dart';
// import 'package:hello_world/component/Image_task.dart';
// import 'package:hello_world/component/Text_task.dart';
// import 'package:hello_world/component/Container_task.dart';
// import 'package:hello_world/component/MutiContainer_task.dart';

void main() => runApp(new MyApp());

// 定义主体
final ThemeData kAndroidTheme = new ThemeData(
  primaryColor: Colors.blue,
  accentColor: Colors.orange,
);

final ThemeData kIOSTheme = new ThemeData(
  primaryColor: Colors.blue,
  accentColor: Colors.red,
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: new AppBar(
          title: Text('常用组件'),
        ),
        body: TableTask(),
        floatingActionButton: new Theme(
          data: Theme.of(context).copyWith(disabledColor: Colors.black),
          child: new FloatingActionButton(
            child: Icon(Icons.access_alarm),
            onPressed: () {
              print('floatingActionButton');
            },
          ),
        ),
      ),
    );
  }
}
