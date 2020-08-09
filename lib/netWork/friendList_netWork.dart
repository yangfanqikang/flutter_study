import 'package:hello_world/util/interface.dart';

Future getFriendList() {
  return request("http://m.app.haosou.com/index/getData?type=1&page=1", '');
}
