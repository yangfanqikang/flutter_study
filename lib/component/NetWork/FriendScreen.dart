import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Friend.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({Key key}) : super(key: key);
  @override
  _FriendsScreenState createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  var url = 'https://randomuser.me/api/?results=30';

  List<Friend> _friends = [];

  _loadFriendsData() async {
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
    HttpClientResponse response = await request.close();
    var jsonString = await response.transform(utf8.decoder).join();
    setState(() {
      _friends = Friend.resolveDataFromResponse(jsonString);
    });
  }

  @override
  void initState() {
    super.initState();
    _loadFriendsData();
  }

  @override
  Widget build(BuildContext context) {
    // return Center(child: RaisedButton(
    //   onPressed: () {
    //     _loadFriendsData();
    //   },
    // ));
    return _builderContent();
  }

  Widget _builderContent() {
    var content;

    if (_friends.isEmpty) {
      content = new Center(
        child: CircularProgressIndicator(),
      );
    } else {
      content = new ListView.builder(
        itemCount: _friends.length,
        itemBuilder: _builderItem,
      );
    }
    return content;
  }

  Widget _builderItem(BuildContext context, int index) {
    var friend = _friends[index];
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(friend.avatar),
      ),
      title: Text(friend.name),
      subtitle: Text(friend.email),
      trailing: Icon(Icons.arrow_right),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
