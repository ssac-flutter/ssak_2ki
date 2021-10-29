import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pixabay_mvvm/data/data_source/pixabay_api.dart';
import 'package:pixabay_mvvm/domain/repository/photo_repository.dart';
import 'package:pixabay_mvvm/domain/repository/result.dart';
import 'package:pixabay_mvvm/domain/model/photo.dart';
import 'package:pixabay_mvvm/presentation/main/photo_state.dart';
import 'package:pixabay_mvvm/presentation/main/ui_event.dart';

class MainViewModel with ChangeNotifier {
  PhotoRepository repository;

  PhotoState _state = PhotoState();

  PhotoState get state => _state;

  MainViewModel(this.repository);

  final _eventController = StreamController<UiEvent>();
  Stream<UiEvent> get eventStream => _eventController.stream;

  Future<void> fetch(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final Result<List<Photo>> results = await repository.getPhotos(query);

    if (results is Success<List<Photo>>) {
      final photos = results.data;
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
        _eventController.add(UiEvent.showSnackBar('네트워크 에러가 발생했습니다'));
      } else {
        print((results as Error).e.toString());
      }
    }
  }
}
