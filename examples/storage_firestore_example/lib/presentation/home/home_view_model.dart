import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storage_firestore_example/domain/model/doc.dart';
import 'package:storage_firestore_example/domain/use_case/fetch_use_case.dart';

class HomeViewModel with ChangeNotifier {
  final FetchUseCase _useCase;

  List<Doc> _items = [];

  UnmodifiableListView<Doc> get items => UnmodifiableListView(_items);

  HomeViewModel(this._useCase);

  Future<void> fetch() async {
    final result = await _useCase();

    result.when(
      success: (items) {
        _items = items;
        notifyListeners();
      },
      error: (message) {
        print(message);
      },
    );

  }
}
