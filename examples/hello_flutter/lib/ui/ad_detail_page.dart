import 'package:flutter/material.dart';
import 'package:hello_flutter/model/ad.dart';

class AdDetailPage extends StatelessWidget {
  final Ad ad;

  const AdDetailPage({Key? key, required this.ad}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ad.title),
      ),
      body: Column(
        children: [
          Hero(
            tag: ad.imageUrl,
            child: Image.network(
              ad.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Hero(
            tag: ad.subTitle,
            child: Text(
              ad.subTitle,
              style: TextStyle(fontSize: 30),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop<Ad>(context, ad);
            },
            child: Text('값 넘기기'),
          ),
        ],
      ),
    );
  }
}
