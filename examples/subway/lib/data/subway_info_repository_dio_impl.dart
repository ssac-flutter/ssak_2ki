import 'package:dio/dio.dart';
import 'package:subway/data/subway_info_repository.dart';
import 'package:subway/model/subway_info.dart';

class SubwayInfoRepositoryDioImpl implements SubwayInfoRepository {
  static const baseUrl =
      'http://swopenapi.seoul.go.kr/api/subway/sample/json/realtimeStationArrival/0/5';

  final dio = Dio();

  @override
  Future<List<SubwayInfo>> fetch(String stationName) async {
    final response = await dio.get('$baseUrl/$stationName');
    Iterable itemsJson = response.data['realtimeArrivalList'];
    return itemsJson.map((e) => SubwayInfo.fromJson(e)).toList();
  }
}
