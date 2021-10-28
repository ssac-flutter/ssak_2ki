import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pixabay_mvvm/data/photo_repository.dart';
import 'package:pixabay_mvvm/data/pixabay_photo_repository_impl.dart';
import 'package:pixabay_mvvm/data/result.dart';
import 'package:pixabay_mvvm/model/photo.dart';
import 'package:pixabay_mvvm/ui/photo_state.dart';

class MainViewModel with ChangeNotifier {
  PhotoRepository repository;

  PhotoState _state = PhotoState();

  PhotoState get state => _state;

  MainViewModel(this.repository);

  Future<void> fetch(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final Result<List<Photo>> results = await repository.getPhotos(query);

    if (results is Success) {
      final photos = (results as Success<List<Photo>>).data;
      _state = state.copyWith(
        photos: photos
            .getRange(
          0,
          min(10, photos.length),
        )
            .toList(),
        isLoading: false,
      );
      notifyListeners();
    } else if (results is Error) {
      if ((results as Error).e is IllegalStateException) {
        print('내가 뭔가 큰실수 했구나');
      } else {
        print((results as Error).e.toString());
      }
    }


  }
}
