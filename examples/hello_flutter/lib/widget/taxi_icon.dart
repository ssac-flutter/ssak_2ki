import 'package:flutter/material.dart';

class TaxiIcon extends StatelessWidget {
  final String title;

  const TaxiIcon({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: AssetImage('assets/taxi.jpg'),
          width: 80,
        ),
        Text(title),
      ],
    );
  }
}
