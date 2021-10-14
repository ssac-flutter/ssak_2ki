import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hits.freezed.dart';

part 'hits.g.dart';

@freezed
class Hits with _$Hits {
  factory Hits({
    required String previewURL, required String tags,
  }) = _Hits;

  factory Hits.fromJson(Map<String, dynamic> json) => _$HitsFromJson(json);
}