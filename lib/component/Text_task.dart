import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextTask extends StatelessWidget {
  const TextTask({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          new Text(
            '这是一段文字,我的国惠康黑客技术逗号分开设计会犯打开就是付货款',
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: new TextStyle(
                color: Colors.red, fontSize: 30, fontStyle: FontStyle.italic),
          ),
          new Text.rich(new TextSpan(
              text: '文本一',
              style: new TextStyle(
                color: Colors.blue,
                fontSize: 20,
              ),
              children: <TextSpan>[
                new TextSpan(
                  text: '文本一',
                  style: new TextStyle(
                    color: Colors.yellow,
                    fontSize: 20,
                  ),
                ),
                new TextSpan(
                    text: '文本一',
                    style: new TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () {
                        print('dianjile');
                      })
              ]))
        ],
      ),
    );
  }
}
