import 'package:flutter/material.dart';

class ButtonTask extends StatefulWidget {
  const ButtonTask({Key key}) : super(key: key);
  @override
  _ButtonTaskState createState() => _ButtonTaskState();
}

class _ButtonTaskState extends State<ButtonTask> {
  var selectedValue;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          new MaterialButton(
            onPressed: () {
              print('MaterialButton');
            },
            color: Colors.green,
            child: new Text('MaterialButton'),
          ),
          new RaisedButton(
            onPressed: () {
              print('RaisedButton');
            },
            color: Colors.green,
            child: new Text('RaisedButton'),
            elevation: 10, // 立体效果
          ),
          new FlatButton(
            onPressed: () {
              print('FlatButton');
            },
            color: Colors.green,
            child: new Text('FlatButton'),
          ),
          new DropdownButton(
              hint: new Text('请选择你的性别'),
              value: selectedValue,
              items: [
                new DropdownMenuItem(child: new Text('男'), value: '1'),
                new DropdownMenuItem(child: new Text('女'), value: '0'),
              ],
              onChanged: (v) {
                setState(() {
                  selectedValue = v;
                });
              }),
          new IconButton(
            icon: Icon(
              Icons.access_alarm,
              color: Colors.blue,
              size: 30,
            ),
            onPressed: () {
              print('IconButton');
            },
          ),
        ],
      ),
    );
  }
}
