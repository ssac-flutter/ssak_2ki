import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pixabay_mvvm/data/photo_repository.dart';
import 'package:pixabay_mvvm/model/photo.dart';

class MainViewModel with ChangeNotifier {
  PhotoRepository repository;

  List<Photo> _photos = [];

  UnmodifiableListView<Photo> get photos => UnmodifiableListView(_photos);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  MainViewModel(this.repository);

  Future<void> fetch(String query) async {
    _isLoading = true;
    notifyListeners();
    _photos = await repository.getPhotos(query);
    _photos = _photos.getRange(0, min(10, _photos.length)).toList();
    _isLoading = false;
    notifyListeners();
  }
}
