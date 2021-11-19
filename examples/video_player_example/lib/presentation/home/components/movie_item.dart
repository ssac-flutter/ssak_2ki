import 'package:flutter/material.dart';
import 'package:video_player_example/domain/model/movie.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;
  final Function(Movie)? callBack;
  final bool isSelected;

  const MovieItem({
    Key? key,
    required this.movie,
    this.callBack,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isSelected ? Colors.lightGreen : Colors.white,
      child: ListTile(
        title: Text(movie.title),
        onTap: () {
          callBack?.call(movie);
        },
      ),
    );
  }
}
