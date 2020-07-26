import 'package:flutter/material.dart';

class MutiContainerTask extends StatelessWidget {
  const MutiContainerTask({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          color: Colors.red,
          child: Stack(
            children: <Widget>[
              Text('可换行科幻护航111'),
              Text('可换行科幻护航111'),
              Text('可换行科幻护航111')
            ],
          ),
        ),
        Container(
          width: 100,
          height: 100,
          color: Colors.blue,
          child: IndexedStack(
            index: 2,
            children: <Widget>[
              Text('可换行科幻护航111'),
              Text('可换行科幻护航111'),
              Text('可换行科幻护航111')
            ],
          ),
        ),
        Container(
          width: 100,
          height: 100,
          color: Colors.yellow,
          child: Wrap(
            children: <Widget>[
              Text('可换行科幻护航111'),
              Text('可换行科幻护航111'),
              Text('可换行科幻护航111')
            ],
          ),
        ),
        Container(
          width: 200,
          height: 200,
          color: Colors.orange,
          child: Row(
            children: <Widget>[
              Text('data'),
              Text('data'),
              Text('data'),
            ],
          ),
        )
      ],
    );
  }
}
