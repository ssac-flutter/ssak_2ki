import 'package:flutter/material.dart';
import 'package:subway/data/subway_info_repository_dio_impl.dart';
import 'package:subway/data/subway_info_repository_impl.dart';
import 'package:subway/model/subway_info.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // final _repository = SubwayInfoRepositoryImpl();
  final _repository = SubwayInfoRepositoryDioImpl();
  final _textController = TextEditingController();

  List<SubwayInfo> _items = [];

  @override
  void initState() {
    super.initState();

    _repository.fetch("수원").then((value) {
      print(value);
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                onPressed: () async {
                  _items = await _repository.fetch(_textController.text);

                  setState(() {});
                },
                child: const Text('검색'),
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
              itemCount: _items.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                SubwayInfo subwayInfo = _items[index];
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
