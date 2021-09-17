import 'package:flutter/material.dart';
import 'package:hello_flutter/widget/ad_widget.dart';
import 'package:hello_flutter/widget/taxi_icon.dart';

class KakaoPage extends StatelessWidget {
  KakaoPage({Key key}) : super(key: key);

  // 데이터 (값)
  final _items = [
    '택시', // 변환 => TaxiIcon(title: '택시')
    '버스',
    '자전거',
    '대리',
    '택시2',
    '택시2',
  ];

  @override
  Widget build(BuildContext context) {
    // 기존 Java 스타일
    // final List<Widget> items = []
    // final items = <Widget>[];
    // for (var i = 0; i < _items.length; i++) {
    //   items.add(TaxiIcon(title: _items[i]));
    // }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kakao T',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          GridView.count(
            crossAxisCount: 4,
            children: _items.map((e) => TaxiIcon(title: e)).toList(),
            shrinkWrap: true,
          ),
          // 광고자리
          AdWidget(
            title: '안녕하세요',
            subTitle: '빨리 끝냅시다',
            imageUrl:
                'https://flutter.github.io/assets-for-api-docs/assets/painting/box_decoration.png',
            color: Colors.yellow,
          ),
          AdWidget(
            title: '안녕하세요',
            subTitle: '빨리 끝냅시다',
            imageUrl:
                'https://flutter.github.io/assets-for-api-docs/assets/painting/box_decoration.png',
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
