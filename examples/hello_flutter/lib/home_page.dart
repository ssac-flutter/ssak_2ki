import 'package:flutter/material.dart';

// StatelessWidget : 상태가 없는 위젯 (기본) > stless, stl
class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('위젯 연습'),
      ),
      body: Column(
        children: [
          Text('aaaa'),
          Text('aaaa'),
          Text('aaaa'),
          Text('aaaa'),
          Text('aaaa'),
        ],
      ),
    );
  }
}