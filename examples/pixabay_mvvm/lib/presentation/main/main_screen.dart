import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixabay_mvvm/domain/model/photo.dart';
import 'package:pixabay_mvvm/presentation/main/main_view_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final viewModel = Get.find<MainViewModel>();

  @override
  void initState() {
    super.initState();

    viewModel.fetch('iphone');

    viewModel.eventStream.listen((event) {
      event.when(showSnackBar: (message) {
        final snackBar = SnackBar(content: Text(message));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }, endLoading: () {
        const snackBar = SnackBar(content: Text('로딩이 완료되었습니다'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final state = viewModel.state;
        List<Photo> photos = state.value.photos;
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'title'.tr,
              style: const TextStyle(color: Colors.black),
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
              const SizedBox(
                height: 16,
              ),
              state.value.isLoading
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
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(16.0)),
                                  ),
                                  height: 100.0,
                                ))
                            .toList(),
                      ),
                    )
            ],
          ),
        );
      },
    );
  }
}
