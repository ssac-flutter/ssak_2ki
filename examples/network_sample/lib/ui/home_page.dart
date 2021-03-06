import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:network_sample/model/todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('네트워크 통신'),
      ),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () async {
              setState(() {});
            },
            child: const Text('가져오기'),
          ),
          FutureBuilder<Todo>(
              future: fetch(),
              builder: (context, AsyncSnapshot<Todo> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return const Text('에러가 발생했습니다');
                }

                if (!snapshot.hasData) {
                  return const Text('데이터가 없습니다');
                }

                Todo todo = snapshot.data!;

                return Text(todo.title);
              }),
          ElevatedButton(
            onPressed: () async {
            },
            child: const Text('목록 가져오기'),
          ),
          FutureBuilder<List<Todo>>(
              future: fetchList(),
              initialData: const [],
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return const Text('에러가 발생했습니다');
                }

                if (!snapshot.hasData) {
                  return const Text('데이터가 없습니다');
                }

                List<Todo> todos = snapshot.data!;

                return ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: todos.map((e) => Text(e.title)).toList(),
                );
              }),
        ],
      ),
    );
  }

  Future<Todo> fetch() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/todos/1'); // 오래

    print(response.statusCode);
    print(response.body);

    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Todo todo = Todo.fromJson(jsonResponse);

    return todo;
  }

  Future<List<Todo>> fetchList() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/todos'); // 오래

    Iterable jsonResponse = jsonDecode(response.body);
    List<Todo> todos = jsonResponse.map((e) => Todo.fromJson(e)).toList();

    return todos;
  }
}
