import 'package:subway/model/subway_info.dart';

class SubwayState {
  bool isLoading;
  List<SubwayInfo> items;

  SubwayState({this.isLoading = false, this.items = const []});
}
