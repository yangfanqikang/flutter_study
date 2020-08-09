import 'package:flutter/material.dart';
import 'package:hello_world/netWork/friendList_netWork.dart';
import 'package:hello_world/trend/second/friend.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: getFriendList(),
            builder: (context, snapShot) {
              if (snapShot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapShot.connectionState == ConnectionState.done) {
                if (snapShot.hasError) {
                  return new Center(child: Text('Error: ${snapShot.error}'));
                }
                if (!snapShot.hasData) {
                  return new Center(child: Text('获取数据失败'));
                }

                return getListWidget(snapShot.data);
              }
            }));
  }

  Widget getListWidget(Map data) {
    List<Friend> friends = Friend.resolveDataFromReponse(data);
    return GridView.builder(
      itemCount: friends.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        crossAxisCount: 3,
      ),
      itemBuilder: (BuildContext context, int index) {
        return getItemContainer(friends[index], index);
      },
    );
  }

  Widget getItemContainer(Friend friend, int index) {
    return InkWell(
      child: Card(
          child: Image.network(
        friend.avatar,
        fit: BoxFit.fitWidth,
      )),
      onTap: () {},
    );
  }
}
