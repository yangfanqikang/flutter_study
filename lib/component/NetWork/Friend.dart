import 'dart:convert';

class Friend {
  final String avatar;
  final String name;
  final String email;

  Friend({this.avatar, this.name, this.email});

  // 将jsonString转换成List<Friend>
  static List<Friend> resolveDataFromResponse(String response) {
    var json = jsonDecode(response);
    var results = json["results"];
    var friends =
        results.map((obj) => Friend.fromMap(obj)).toList().cast<Friend>();

    return friends;
  }

  // 将map转换成Friend
  static Friend fromMap(Map map) {
    var name = map['name'];

    return new Friend(
        avatar: map['picture']['large'],
        email: map['email'],
        name: '${name['first']} ${name['last']}');
  }
}
