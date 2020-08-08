import 'package:flutter/material.dart';

class ImageTask extends StatelessWidget {
  const ImageTask({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        Text('data'),
        new Image.asset(
          'assets/images/123.png',
          width: 100,
          height: 100,
        ),
        new Image.network(
          'https://cdn2.jianshu.io/assets/default_avatar/4-3397163ecdb3855a0a4139c34a695885.jpg',
          width: 120,
          height: 120,
          fit: BoxFit.contain,
          repeat: ImageRepeat.repeat,
        ),
        new Image(
          image: new NetworkImage(
              'https://cdn2.jianshu.io/assets/default_avatar/4-3397163ecdb3855a0a4139c34a695885.jpg'),
          width: 120,
          height: 120,
        ),
        new CircleAvatar(
          backgroundImage: new NetworkImage(
              'https://cdn2.jianshu.io/assets/default_avatar/4-3397163ecdb3855a0a4139c34a695885.jpg'),
          radius: 80,
        ),
        new FadeInImage.assetNetwork(
            placeholder: 'assets/images/123.png',
            image:
                'https://cdn2.jianshu.io/assets/default_avatar/4-3397163ecdb3855a0a4139c34a695885.jpg'),
      ],
    );
  }
}
