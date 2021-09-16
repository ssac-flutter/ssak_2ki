import 'package:flutter/material.dart';

// stful : stf
class HomePage2 extends StatefulWidget {
  const HomePage2({Key key}) : super(key: key);

  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  // String, int, double, bool,          num, 악의 축 dynamic(쓰면 안 되는 애)

  // 상태 (State)
  String text = '중간!!!!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage2'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(text),
            ElevatedButton(
              onPressed: () {
                print('click!!!!');   // run 탭에서 확인

                // 화면을 다시 그려줌!!
                setState(() {
                  text = '짜잔!!!!';
                });
              },   // 람다식
              child: Text('버튼'),
            ),
          ],
        ),
      ),
    );
  }
}