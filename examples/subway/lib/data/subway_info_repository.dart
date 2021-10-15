import 'package:subway/model/subway_info.dart';

abstract class SubwayInfoRepository {
  Future<List<SubwayInfo>> fetch(String stationName);
}
