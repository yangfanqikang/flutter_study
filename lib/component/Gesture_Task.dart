import 'package:flutter/material.dart';

class GestureTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('点击了');
      },
      onLongPress: () {
        print('长按了');
      },
      onHorizontalDragStart: (startDetail) {
        print('拖拽开始');
      },
      onScaleUpdate: (updateDetail) {
        print('缩放');
      },
      child: Container(
        color: Color.fromARGB(100, 220, 123, 168),
        child: new Center(
          child: Text('flutter手势'),
        ),
      ),
    );
  }
}
