import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'navigation/navigation_task.dart';

class NearScreen extends StatefulWidget {
  @override
  _NearScreenState createState() => _NearScreenState();
}

class _NearScreenState extends State<NearScreen> {
  // 数据存数
  void saveSomething() async {
    final perference = await SharedPreferences.getInstance();
    perference.setString('localKey', 'LocalData');
  }

  void readSomething() async {
    final perference = await SharedPreferences.getInstance();
    var result = perference.getString('localKey');
    print(result);
  }

  @override
  void initState() {
    saveSomething();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('附近'),
      ),
      body: Center(
        child: new Column(
          children: <Widget>[
            RaisedButton(
              child: Text('导航学习'),
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new NavigationTaskScreen()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
