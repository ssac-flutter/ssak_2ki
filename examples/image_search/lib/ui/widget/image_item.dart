import 'package:flutter/material.dart';
import 'package:image_search/model/hits.dart';

class ImageItem extends StatelessWidget {
  final Hits hits;

  const ImageItem({Key? key, required this.hits}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          hits.previewURL,
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        ),
        Text(hits.tags),
      ],
    );
  }
}
