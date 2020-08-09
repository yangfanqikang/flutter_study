import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderDemo extends StatefulWidget {
  @override
  _ProviderDemoState createState() => _ProviderDemoState();
}

class _ProviderDemoState extends State<ProviderDemo> {
  // int _count = 0;
  // void _increaseCount() {
  //   setState(() {
  //     _count += 1;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => CounterProvider())],
        child: Consumer<CounterProvider>(builder: (context, counter, _) {
          return Scaffold(
            appBar: AppBar(title: Text('InheritedWidget')),
            body: MiddleCount(),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: counter._increaseCount,
            ),
          );
        }));
  }
}

class MiddleCount extends StatelessWidget {
  // int counter = 0;
  // VoidCallback increaseCount;

  // MiddleCount({Key key, this.counter, this.increaseCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Counter(),
      ),
    );
  }
}

class Counter extends StatelessWidget {
  // int counter = 0;
  // VoidCallback increaseCount;

  // Counter({Key key, this.counter, this.increaseCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
      onTap: Provider.of<CounterProvider>(context)._increaseCount,
      child: Text(
        '${Provider.of<CounterProvider>(context).count}',
        style: TextStyle(fontSize: 30),
      ),
    ));
  }
}

class CounterProvider with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void _increaseCount() {
    _count += 1;
    notifyListeners();
  }
}
