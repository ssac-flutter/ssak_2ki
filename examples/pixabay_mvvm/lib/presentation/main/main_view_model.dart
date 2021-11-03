import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pixabay_mvvm/data/data_source/exceptions.dart';
import 'package:pixabay_mvvm/domain/model/photo.dart';
import 'package:pixabay_mvvm/domain/repository/result.dart';
import 'package:pixabay_mvvm/domain/use_case/main_use_cases.dart';
import 'package:pixabay_mvvm/presentation/main/photo_state.dart';
import 'package:pixabay_mvvm/presentation/main/ui_event.dart';

class MainViewModel with ChangeNotifier {
  MainUseCases useCases;

  PhotoState _state = PhotoState();

  PhotoState get state => _state;

  MainViewModel(this.useCases);

  final _eventController = StreamController<UiEvent>();
  Stream<UiEvent> get eventStream => _eventController.stream;

  Future<void> fetch(String query) async {
    _state = state.copyWith(isLoading: true);

    final Result<List<Photo>> results = await useCases.getPhotos(query);

    results.when(success: (photos) {
      _state = state.copyWith(photos: photos, isLoading: false);
      _eventController.add(const UiEvent.endLoading());
      notifyListeners();
    }, error: (e) {
      if ((e as Error).e is IllegalStateException) {
        print('내가 뭔가 큰실수 했구나');
        _eventController.add(const UiEvent.showSnackBar('네트워크 에러가 발생했습니다'));
      } else {
        print((results as Error).e.toString());
      }
      _state = state.copyWith(isLoading: false);
    });
  }
}
