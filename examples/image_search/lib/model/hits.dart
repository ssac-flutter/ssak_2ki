import 'package:json_annotation/json_annotation.dart';

part 'hits.g.dart';

@JsonSerializable()
class Hits {
  String previewURL;
  String tags;

  Hits(this.previewURL, this.tags);

  factory Hits.fromJson(Map<String, dynamic> json) => _$HitsFromJson(json);

  Map<String, dynamic> toJson() => _$HitsToJson(this);
}