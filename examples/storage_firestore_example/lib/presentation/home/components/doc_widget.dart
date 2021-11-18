import 'package:flutter/material.dart';
import 'package:storage_firestore_example/domain/model/doc.dart';

class DocWidget extends StatelessWidget {
  final Doc doc;

  const DocWidget({Key? key, required this.doc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Uri uri = Uri.parse(doc.downloadUrl);
    String extension = uri.pathSegments.last.split('.').last;
    return ListTile(
      title: Text(doc.fileName),
      trailing: _buildIcon(extension),
    );
  }

  Widget _buildIcon(String extension) {
    switch (extension) {
      case 'pdf':
        return const Icon(Icons.document_scanner);
      case 'jpg':
        return const Icon(Icons.photo);
      default:
        return const Text('아이콘 없음');
    }
  }
}
