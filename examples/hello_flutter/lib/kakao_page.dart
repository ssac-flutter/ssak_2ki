import 'package:flutter/material.dart';
import 'package:hello_flutter/widget/ad_widget.dart';
import 'package:hello_flutter/widget/taxi_icon.dart';

class KakaoPage extends StatelessWidget {
  KakaoPage({Key key}) : super(key: key);

  // 데이터 (값)
  final _menuItems = [
    '택시', // 변환 => TaxiIcon(title: '택시')
    '버스',
    '자전거',
    '대리',
    '택시2',
    '택시2',
  ];

  // 광고 데이터
  final _adItems = [
    {
      'title': '안녕하세요!!!!!!',
      'subTitle': '빨리 끝냅시다',
      'imageUrl':
          'https://flutter.github.io/assets-for-api-docs/assets/painting/box_decoration.png',
      'color': Colors.yellow,
    },
    {
      'title': '안녕하세요',
      'subTitle': '빨리 끝냅시다',
      'imageUrl':
          'https://flutter.github.io/assets-for-api-docs/assets/painting/box_decoration.png',
      'color': Colors.green,
    }
  ];

  // 공지사항
  final _notices = [
    '첫 번째 공지',
    '첫 번째 공지',
    '첫 번째 공지',
    '첫 번째 공지',
    '첫 번째 공지',
    '첫 번째 공지',
    '첫 번째 공지',
    '첫 번째 공지',
    '첫 번째 공지',
    '첫 번째 공지',
  ];

  @override
  Widget build(BuildContext context) {
    // 기존 Java 스타일
    // final List<Widget> items = []
    // final items = <Widget>[];
    // for (var i = 0; i < _items.length; i++) {
    //   items.add(TaxiIcon(title: _items[i]));
    // }

    final pageController = PageController(initialPage: 0);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kakao T',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          GridView.count(
            crossAxisCount: 4,
            children: _menuItems.map((e) => TaxiIcon(title: e)).toList(),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          ),
          // 광고자리
          AspectRatio(
            aspectRatio: 2 / 1,
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: pageController,
              children: _adItems.map((e) {
                // 작성할 것 있으면 더 작성
                return AdWidget(
                  title: e['title'],
                  subTitle: e['subTitle'],
                  imageUrl: e['imageUrl'],
                  color: e['color'],
                );
              }).toList(),
            ),
          ),
          // 공지
          ..._notices.map((e) => ListTile(
            leading: Icon(Icons.alarm),
            title: Text(e),
            subtitle: Text('이것은 서브!!'),
            trailing: Icon(Icons.arrow_forward_outlined),
          )).toList()
        ],
      ),
    );
  }
}
