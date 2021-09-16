import 'package:flutter/material.dart';
import 'package:hello_flutter/ads/ad_widget.dart';

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
              Column(
                children: [
                  Image(
                    image: AssetImage('assets/taxi.jpg'),
                    width: 100,
                  ),
                  Text('택시'),
                ],
              ),
              Column(
                children: [
                  Image(
                    image: AssetImage('assets/taxi.jpg'),
                    width: 100,
                  ),
                  Text('택시'),
                ],
              ),
              Column(
                children: [
                  Image(
                    image: AssetImage('assets/taxi.jpg'),
                    width: 100,
                  ),
                  Text('택시'),
                ],
              ),
              Column(
                children: [
                  Image(
                    image: AssetImage('assets/taxi.jpg'),
                    width: 100,
                  ),
                  Text('택시'),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Image(
                    image: AssetImage('assets/taxi.jpg'),
                    width: 100,
                  ),
                  Text('택시'),
                ],
              ),
              Column(
                children: [
                  Image(
                    image: AssetImage('assets/taxi.jpg'),
                    width: 100,
                  ),
                  Text('택시'),
                ],
              ),
              Column(
                children: [
                  Image(
                    image: AssetImage('assets/taxi.jpg'),
                    width: 100,
                  ),
                  Text('택시'),
                ],
              ),
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
