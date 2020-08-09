import 'package:flutter/material.dart';

class Friend {
  @required
  final String avatar;
  @required
  final String name;
  @required
  final String email;

  //构造函数
  Friend({this.avatar, this.name, this.email});

  //将jsonString 转换成List<Friend>
  static List<Friend> resolveDataFromReponse(Map responseData) {
    // var json = jsonDecode(responseData);
    var results = responseData['list'];
    var result =
        results.map((obj) => Friend.fromMap(obj)).toList().cast<Friend>();

    return result;
  }

  static Friend fromMap(Map map) {
    return new Friend(
        avatar: map['logo_url'], name: map['name'], email: map['apkid']);
  }
}
