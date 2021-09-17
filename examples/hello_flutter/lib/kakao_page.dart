import 'package:flutter/material.dart';
import 'package:hello_flutter/widget/ad_widget.dart';
import 'package:hello_flutter/widget/taxi_icon.dart';

class KakaoPage extends StatelessWidget {
  const KakaoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TaxiIcon(title: '택시',),
              TaxiIcon(title: '버스',),
              TaxiIcon(title: '자전거',),
              TaxiIcon(title: '대리',),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TaxiIcon(title: '택시2',),
              TaxiIcon(title: '택시3',),
              TaxiIcon(title: '택시4',),
              SizedBox(
                width: 100,
              ),
            ],
          ),

          // 광고자리
          AdWidget(
            title: '안녕하세요',
            subTitle: '빨리 끝냅시다',
            imageUrl: 'https://flutter.github.io/assets-for-api-docs/assets/painting/box_decoration.png',
            color: Colors.yellow,
          ),
          AdWidget(
            title: '안녕하세요',
            subTitle: '빨리 끝냅시다',
            imageUrl: 'https://flutter.github.io/assets-for-api-docs/assets/painting/box_decoration.png',
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}

