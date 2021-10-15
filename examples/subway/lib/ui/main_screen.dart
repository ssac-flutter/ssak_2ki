import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subway/model/subway_info.dart';
import 'package:subway/viewmodel/main_view_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    context.read<MainViewModel>().eventStream.listen((event) {
      if (event is ShowSnackBar) {
        final snackBar = SnackBar(
          content: Text(event.message),
        );

        WidgetsBinding.instance?.addPostFrameCallback((_) {
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
      }
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    final isLoading = viewModel.state.isLoading;
    final items = viewModel.state.items;

    return Scaffold(
      appBar: AppBar(
        title: const Text('지하철 실시간 정보 앱'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _textController,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  viewModel.fetch(_textController.text);
                },
                child: const Text('검색'),
              ),
            ],
          ),
          Expanded(
            child: isLoading
                ? const CircularProgressIndicator()
                : GridView.builder(
                    itemCount: items.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      SubwayInfo subwayInfo = items[index];
                      return Card(
                        color: Colors.amber,
                        child: Column(
                          children: [
                            Text(subwayInfo.trainLineNm),
                            Text(subwayInfo.subwayHeading),
                            Text(subwayInfo.arvlMsg2),
                            Text(subwayInfo.arvlMsg3),
                            Text(subwayInfo.recptnDt),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
