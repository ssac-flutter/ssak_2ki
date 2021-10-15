import 'dart:async';

import 'package:flutter/material.dart';
import 'package:subway/data/result.dart';
import 'package:subway/data/subway_info_repository.dart';
import 'package:subway/model/subway_info.dart';
import 'package:subway/viewmodel/subway_state.dart';

class MainViewModel extends ChangeNotifier {
  final SubwayInfoRepository repository;

  final SubwayState _state = SubwayState();

  SubwayState get state => _state;

  final _eventController = StreamController<UiEvent>.broadcast();

  Stream<UiEvent> get eventStream => _eventController.stream;

  MainViewModel({required this.repository});

  Future<void> fetch(String stationName) async {
    state.isLoading = true;
    notifyListeners();

    Result result = await repository.fetch(stationName);
    if (result is Success) {
      state.items = result.data;
    } else if (result is Error) {
      if (result.e is InvalidSubwayInfoException) {
        final exception = result.e as InvalidSubwayInfoException;
        _eventController.add(UiEvent.showSnackBar(exception.message));
      }
    }

    state.isLoading = false;
    notifyListeners();
  }
}

abstract class UiEvent {
  factory UiEvent.showSnackBar(String message) = ShowSnackBar;
}

class ShowSnackBar implements UiEvent {
  final String message;

  ShowSnackBar(this.message);
}
