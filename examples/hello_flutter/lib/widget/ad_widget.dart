import 'package:flutter/material.dart';

class AdWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imageUrl;
  final Color color;

  const AdWidget({
    Key key,
    String this.title,
    String this.subTitle,
    String this.imageUrl,
    Color this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      // color: Colors.green,  // BoxDecoration 쓸 때는 Container color 쓰면 에러
      margin: EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  Hero(
                    tag: subTitle,
                    child: Text(subTitle),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Hero(
              tag: imageUrl,
              child: Image.network(
                imageUrl,
                width: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
