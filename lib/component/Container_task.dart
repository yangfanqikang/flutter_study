import 'package:flutter/material.dart';

class ContainerTask extends StatelessWidget {
  const ContainerTask({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   color: Colors.yellow,
    //   child: Text('这是一个帅哥,他叫邹智睿'),
    //   // width: 200,
    //   // height: 300,
    //   // margin: new EdgeInsets.all(20),
    //   // margin: new EdgeInsets.fromLTRB(10, 20, 30, 40));
    //   // margin: new EdgeInsets.only(left: 10, right: 20, top: 90, bottom: 80)
    //   // margin: new EdgeInsets.symmetric(vertical: 20, horizontal: 40)
    //   // constraints: new BoxConstraints.expand(),
    //   constraints: BoxConstraints(
    //     maxWidth: 400,
    //     minWidth: 399,
    //   ),
    // );
    // 宽度因子的使用
    // return Container(
    //     color: Colors.red,
    //     width: 100,
    //     height: 100,
    //     child: FractionallySizedBox(
    //       alignment: Alignment.topLeft,
    //       widthFactor: 2,
    //       heightFactor: 0.5,
    //       child: Container(color: Colors.blue),
    //     ));
    // 对齐方式
    // return Center(
    //   child: Container(
    //     color: Colors.red,
    //     width: 200,
    //     height: 200,
    //     child: Text(
    //       'data',
    //       style: TextStyle(fontSize: 30),
    //     ),
    //     // alignment: Alignment.center,
    //     alignment: Alignment(-0.5, 0),
    //   ),
    // );
    // 对齐
    // return Align(
    //     child: Text(
    //   'data',
    //   style: TextStyle(fontSize: 30),
    // ));

    // padding
    return Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          color: Colors.red,
        ));
  }
}
