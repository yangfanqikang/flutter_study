import 'package:flutter/material.dart';

class TableTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Table(
      border: TableBorder.all(
        color: Colors.green,
        width: 3.0,
        style: BorderStyle.solid,
      ),
      columnWidths: {
        0: FixedColumnWidth(100),
        1: FixedColumnWidth(100),
        2: FixedColumnWidth(100)
      },
      children: [
        TableRow(children: [Text('姓名'), Text('性别'), Text('年龄')]),
        TableRow(children: [Text('张三'), Text('男'), Text('23')]),
        TableRow(children: [Text('李四'), Text('女'), Text('27')]),
        TableRow(children: [Text('王五'), Text('男'), Text('33')]),
      ],
    ));
  }
}
