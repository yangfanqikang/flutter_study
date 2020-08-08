import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final String content;
  SecondPage({this.content});
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text('二级页面'),
        ),
        body: Center(
          child: new Column(
            children: <Widget>[
              RaisedButton(
                child: Text('返回方式一'),
                onPressed: () {
                  Navigator.of(context).pop('返回的数据');
                },
              ),
              RaisedButton(
                child: Text('返回方式二'),
                onPressed: () {
                  Navigator.of(context).popAndPushNamed('/third');
                },
              )
            ],
          ),
        ));
  }
}
