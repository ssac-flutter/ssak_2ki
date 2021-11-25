import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player_example/presentation/home/home_view_model.dart';

import 'components/movie_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void dispose() {
    final viewModel = context.read<HomeViewModel>();
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    final state = viewModel.state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Player Sample 2'),
      ),
      body: Column(
        children: [
          viewModel.chewieController == null
              ? const CircularProgressIndicator()
              : AspectRatio(
                  aspectRatio: viewModel.aspectRatio,
                  child: Chewie(controller: viewModel.chewieController!),
                ),
          ListView(
            shrinkWrap: true,
            children: state.movies
                .map(
                  (movie) => MovieItem(
                    movie: movie,
                    isSelected: state.selectedMovie! == movie,
                    callBack: (selectedMovie) {
                      viewModel.setSelectMovie(selectedMovie);
                    },
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
