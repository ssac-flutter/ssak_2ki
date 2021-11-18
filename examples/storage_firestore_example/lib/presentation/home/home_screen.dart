import 'package:flutter/material.dart';
import 'package:storage_firestore_example/domain/model/doc.dart';
import 'package:storage_firestore_example/presentation/add/add_screen.dart';
import 'package:storage_firestore_example/presentation/home/components/doc_widget.dart';
import 'package:storage_firestore_example/presentation/home/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      final viewModel = context.read<HomeViewModel>();
      viewModel.fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Storage Sample'),
      ),
      body: _buildBody(viewModel.items),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildBody(List<Doc> docs) {
    return ListView.builder(
      itemCount: docs.length,
      itemBuilder: (context, index) {
        return DocWidget(doc: docs[index]);
      },
    );
  }
}
