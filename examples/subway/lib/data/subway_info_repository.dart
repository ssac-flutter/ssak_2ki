import 'package:subway/data/result.dart';

abstract class SubwayInfoRepository {
  Future<Result> fetch(String stationName);
}
