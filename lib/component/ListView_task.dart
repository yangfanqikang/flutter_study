import 'package:flutter/material.dart';

class ListViewTask extends StatefulWidget {
  const ListViewTask({Key key}) : super(key: key);
  @override
  _ListViewTaskState createState() => _ListViewTaskState();
}

class _ListViewTaskState extends State<ListViewTask> {
  final List<String> items = List.generate(50, (index) => 'item $index');
  @override
  Widget build(BuildContext context) {
    return getListView1();
  }

  // 方式一: 简单方式,使用小批量的固定数据
  // getListView1() {
  //   return new ListView(
  //     padding: EdgeInsets.all(20),
  //     children: <Widget>[
  //       new Text('data1'),
  //       new Text('data2'),
  //       new Text('data3'),
  //       new Text('data4'),
  //       new Text('data5'),
  //     ],
  //   );
  // }

  //方式二 注意 ListTile的使用前提是当前界面时使用脚手架
  // getListView1() {
  //   return ListView.builder(
  //       itemCount: items.length,
  //       itemBuilder: (content, index) {
  //         // var content = items[index];
  //         // return new Padding(
  //         //   padding: EdgeInsets.all(20),
  //         //   child: Text(content),
  //         // );

  //         return ListTile(
  //           leading: Text('leading'),
  //           title: Text('title'),
  //           subtitle: Text('subtitle'),
  //           trailing: Icon(Icons.access_time),
  //           onTap: () {
  //             print('点击了');
  //           },
  //         );
  //       });
  // }

  // 方式三
  // getListView1() {
  //   return new ListView.separated(
  //     itemBuilder: (content, index) {
  //       var content = items[index];
  //       return new Padding(
  //         padding: EdgeInsets.all(20),
  //         child: Text(content),
  //       );
  //     },
  //     separatorBuilder: (content, index) {
  //       return Divider(
  //         color: Colors.red,
  //         indent: 10,
  //         endIndent: 20,
  //         height: 10,
  //       );
  //     },
  //     itemCount: items.length,
  //   );
  // }

  //方法四
  getListView1() {
    return new ListView.builder(
      itemCount: 20,
      itemBuilder: (content, index) {
        var content = items[index];
        return Dismissible(
          background: Container(
            color: Colors.red,
            child: Center(
              child: Text('删除'),
            ),
          ),
          onDismissed: (direction) {
            items.remove(index);
          },
          key: Key(content),
          child: ListTile(title: Text(content)),
        );
      },
    );
  }
}
