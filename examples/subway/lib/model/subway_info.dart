import 'package:json_annotation/json_annotation.dart';

part 'subway_info.g.dart';

@JsonSerializable()
class SubwayInfo {
  String trainLineNm;
  String recptnDt;
  String arvlMsg2;
  String arvlMsg3;
  String subwayHeading;

  SubwayInfo({
    required this.trainLineNm,
    required this.recptnDt,
    required this.arvlMsg2,
    required this.arvlMsg3,
    required this.subwayHeading,
  });

  factory SubwayInfo.fromJson(Map<String, dynamic> json) =>
      _$SubwayInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SubwayInfoToJson(this);
}
