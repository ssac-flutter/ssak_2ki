import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _result = '';

  // 최초에 로드 될 때 호출
  @override
  void initState() {
    super.initState();

    fetch();
  }

  // initState -> ? -> ? -> build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('네트워크 통신'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              fetch();
            },
            child: Text('가져오기'),
          ),
          Text(_result),
        ],
      ),
    );
  }

  void fetch() {
    http
        .get('https://jsonplaceholder.typicode.com/todos/1')
        .then((response) {
      print(response.statusCode);
      print(response.body);

      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      String title = jsonResponse['title'];

      print(title);

      setState(() {
        _result = title;
      });
    });
  }
}
