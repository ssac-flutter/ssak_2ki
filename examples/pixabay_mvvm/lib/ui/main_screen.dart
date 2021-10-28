import 'package:flutter/material.dart';
import 'package:pixabay_mvvm/model/photo.dart';
import 'package:pixabay_mvvm/ui/main_view_model.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    Future.microtask(() => context.read<MainViewModel>().fetch('iphone'));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    final state = viewModel.state;
    List<Photo> photos = state.photos;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "PixaBay",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {
                        if (_controller.text.isNotEmpty) {
                          viewModel.fetch(_controller.text);
                          _controller.clear();
                        }
                      },
                      icon: const Icon(Icons.search))),
              controller: _controller,
            ),
          ),
          const Text("Create By sunmkim"),
          const SizedBox(
            height: 16,
          ),
          state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : Expanded(
            child: GridView(
              padding: const EdgeInsets.all(16.0),
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16),
              children: photos
                  .map((photo) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(photo.imageUrl)),
                  borderRadius:
                  const BorderRadius.all(Radius.circular(16.0)),
                ),
                height: 100.0,
              ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}