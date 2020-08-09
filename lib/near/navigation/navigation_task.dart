import 'package:flutter/material.dart';
import 'package:hello_world/near/navigation/secondPage.dart';
import 'package:hello_world/near/provider/provider_task.dart';

class NavigationTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text('导航学习'),
        ),
        body: Center(
          child: new Column(
            children: <Widget>[
              RaisedButton(
                child: Text('静态路由跳转'),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed('/second')
                      .then((value) => {print(value)});
                },
              ),
              RaisedButton(
                child: Text('动态路由跳转'),
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) =>
                              new SecondPage(content: '传递的数据')));
                },
              ),
              RaisedButton(
                child: Text('动画自定义跳转'),
                onPressed: () {
                  Navigator.of(context).push(
                    new PageRouteBuilder(
                      pageBuilder: (context, _, __) {
                        return SecondPage(content: '传递的数据1');
                      },
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return new FadeTransition(
                          opacity: animation,
                          child: new SlideTransition(
                            position: new Tween<Offset>(
                              begin: Offset(0, 1),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          ),
                        );
                      },
                      transitionDuration: Duration(seconds: 5),
                    ),
                  );
                },
              ),
              RaisedButton(
                child: Text('provider学习'),
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new ProviderTask()));
                },
              ),
            ],
          ),
        ));
  }
}
