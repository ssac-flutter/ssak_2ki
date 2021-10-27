import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pixabay_mvvm/data/photo_repository.dart';
import 'package:pixabay_mvvm/model/photo.dart';

class MainViewModel with ChangeNotifier {
  PhotoRepository repository;

  List<Photo> _photos = [];
  UnmodifiableListView<Photo> get photos => UnmodifiableListView(_photos);

  MainViewModel(this.repository);

  Future<List<Photo>> fetch(String query) async {
    _photos = await repository.getPhotos(query);
    _photos = _photos.getRange(0, min(10, _photos.length)).toList();
    notifyListeners();
    return photos;
  }
}