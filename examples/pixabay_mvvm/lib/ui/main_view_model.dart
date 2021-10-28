import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pixabay_mvvm/data/photo_repository.dart';
import 'package:pixabay_mvvm/ui/photo_state.dart';

class MainViewModel with ChangeNotifier {
  PhotoRepository repository;

  PhotoState _state = PhotoState();

  PhotoState get state => _state;

  MainViewModel(this.repository);

  Future<void> fetch(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final results = await repository.getPhotos(query);
    _state = state.copyWith(
      photos: results
          .getRange(
            0,
            min(10, results.length),
          )
          .toList(),
      isLoading: false,
    );

    notifyListeners();
  }
}
