import 'package:flutter/material.dart';
import 'package:image_search/data/pixabayApi.dart';
import 'package:image_search/model/hits.dart';
import 'package:image_search/ui/widget/image_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  final _api = PixabayApi();

  var _result = <Hits>[];
  var _query = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _api.getImages('iphone').then((result) {
      setState(() {
        _result = result;
      });
    });
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
          TextField(
            onChanged: (query) {
              setState(() {
                _query = query;
              });
            },
          ),
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: _result
                .where((e) =>
                    e.tags.toLowerCase().contains(_query.trim().toLowerCase()))
                .map((e) => ImageItem(hits: e))
                .toList(),
          ),
        ],
      ),
    );
  }
}
