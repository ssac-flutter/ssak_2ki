import 'package:flutter/material.dart';
import 'package:image_search/data/pixabayApi.dart';
import 'package:image_search/model/hits.dart';
import 'package:image_search/ui/widget/image_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  final _api = PixabayApi();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('이미지 검색'),
      ),
      body: ListView(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {});
                  FocusScope.of(context).unfocus();
                },
                child: Text('검색'),
              )
            ],
          ),
          FutureBuilder<List<Hits>>(
            future: _api.getImages(
                _controller.text.isEmpty ? 'iphone' : _controller.text),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('에러!!!!');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text('로딩 중...');
              }

              final result = snapshot.data;
              return ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: result.map((e) => ImageItem(hits: e)).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
