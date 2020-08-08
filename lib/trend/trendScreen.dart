import 'package:flutter/material.dart';
import 'package:hello_world/trend/second/articleScreen.dart';
import 'package:hello_world/trend/second/idScreen.dart';
import 'package:hello_world/trend/second/noteSreen.dart';

class TrendScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text('好友'),
        ),
        body: DefaultTabController(
            length: 3,
            child: Column(
              children: <Widget>[
                TabBar(
                  labelColor: Colors.black,
                  indicatorWeight: 1,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: <Widget>[
                    Tab(text: '花记'),
                    Tab(text: '鉴定'),
                    Tab(text: '文章'),
                  ],
                ),
                Expanded(
                  flex: 1,
                  child: TabBarView(
                    children: <Widget>[
                      NoteScreen(),
                      IDScreen(),
                      ArticleScreen(),
                    ],
                  ),
                ),
              ],
            )));
  }
}
