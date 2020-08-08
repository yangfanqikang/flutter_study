import 'package:flutter/material.dart';

class GrideViewTask extends StatefulWidget {
  GrideViewTask({Key key}) : super(key: key);

  final List<String> data = List.generate(20, (index) => 'item $index');
  @override
  _GrideViewTaskState createState() => _GrideViewTaskState();
}

class _GrideViewTaskState extends State<GrideViewTask> {
  @override
  Widget build(BuildContext context) {
    return getGriderViewFunction1(widget.data);
  }

  // 方法一
  // Widget getGriderViewFunction1(List data) {
  //   return GridView.count(
  //     crossAxisCount: 2,
  //     crossAxisSpacing: 10,
  //     mainAxisSpacing: 30,
  //     childAspectRatio: 2,
  //     padding: EdgeInsets.all(20),
  //     children: getWidgetList(data),
  //   );
  // }

  // List<Widget> getWidgetList(List data) {
  //   return data.map((item) => getItemContainer(item)).toList();
  // }

  Widget getItemContainer(String item) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        item,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      color: Colors.blue,
    );
  }

  // 方法二
  // Widget getGriderViewFunction1(List data) {
  //   return new GridView.builder(
  //     itemCount: data.length,
  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //       // 横向显示个数
  //       crossAxisCount: 3,
  //       // 子组件宽高比
  //       childAspectRatio: 1,
  //       // 横向间距
  //       crossAxisSpacing: 10,
  //       // 纵向间距
  //       mainAxisSpacing: 10,
  //     ),
  //     itemBuilder: (context, index) {
  //       return getItemContainer(data[index]);
  //     },
  //   );
  // }

  // 方法san
  Widget getGriderViewFunction1(List data) {
    return new GridView.builder(
      itemCount: data.length,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisSpacing: 20,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return getItemContainer(data[index]);
      },
    );
  }
}
