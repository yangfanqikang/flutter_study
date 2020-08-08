import 'package:flutter/material.dart';

class SingleChildScrollViewTask extends StatelessWidget {
  final List<String> data = List.generate(150, (index) => 'item $index');
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: data
              .map((item) => Text(
                    item,
                    style: TextStyle(fontSize: 20),
                  ))
              .toList(),
        ),
      ),
      controller: ScrollController(
        initialScrollOffset: 120,
        keepScrollOffset: true,
      ),
    );
  }
}
