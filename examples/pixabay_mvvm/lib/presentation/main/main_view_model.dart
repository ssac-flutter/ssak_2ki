import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pixabay_mvvm/data/data_source/exceptions.dart';
import 'package:pixabay_mvvm/domain/model/photo.dart';
import 'package:pixabay_mvvm/domain/repository/photo_repository.dart';
import 'package:pixabay_mvvm/domain/repository/result.dart';
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
    final Result<List<Photo>> results = await repository.getPhotos(query);

    results.when(success: (photos) {
      _state = state.copyWith(
        photos: photos
            .getRange(
              0,
              min(10, photos.length),
            )
            .toList(),
        isLoading: false,
      );
      _eventController.add(const UiEvent.endLoading());
      notifyListeners();
    }, error: (e) {
      if ((e as Error).e is IllegalStateException) {
        print('내가 뭔가 큰실수 했구나');
        _eventController.add(const UiEvent.showSnackBar('네트워크 에러가 발생했습니다'));
      } else {
        print((results as Error).e.toString());
      }
    }, loading: (bool isLoading) {
      _state = state.copyWith(isLoading: isLoading);
      notifyListeners();
    });
  }
}
