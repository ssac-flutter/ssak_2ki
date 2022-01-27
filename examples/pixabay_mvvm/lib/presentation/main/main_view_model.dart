import 'dart:async';

import 'package:get/get.dart';
import 'package:pixabay_mvvm/domain/model/photo.dart';
import 'package:pixabay_mvvm/domain/repository/result.dart';
import 'package:pixabay_mvvm/domain/use_case/main_use_cases.dart';
import 'package:pixabay_mvvm/presentation/main/photo_state.dart';
import 'package:pixabay_mvvm/presentation/main/ui_event.dart';

class MainViewModel {
  MainUseCases useCases;

  Rx<PhotoState> state = PhotoState().obs;

  MainViewModel(this.useCases);

  final _eventController = StreamController<UiEvent>();
  Stream<UiEvent> get eventStream => _eventController.stream;

  Future<void> fetch(String query) async {
    state.value = state.value.copyWith(isLoading: true);

    final Result<List<Photo>> results = await useCases.getPhotos(query);

    results.when(success: (photos) {
      state.value = state.value.copyWith(photos: photos, isLoading: false);
      _eventController.add(const UiEvent.endLoading());
    }, error: (message) {
      _eventController.add(UiEvent.showSnackBar(message));
      state.value = state.value.copyWith(isLoading: false);
    });
  }
}
