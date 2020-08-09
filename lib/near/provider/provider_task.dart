import 'package:flutter/material.dart';

import 'InheritedWidgetDemo.dart';
import 'ScopedModelDemo.dart';
import 'providerDemo.dart';

class ProviderTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('导航学习'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('InheritedWidget'),
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new InheritedWidgetDemo()));
              },
            ),
            RaisedButton(
              child: Text('ScopedModel'),
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new ScopedModelDemo()));
              },
            ),
            RaisedButton(
              child: Text('Provider'),
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new ProviderDemo()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
