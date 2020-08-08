import 'package:flutter/material.dart';
import 'package:hello_world/navigation/navigation_task.dart';

class NearScreen extends StatelessWidget {
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

class NavigationTask {}
