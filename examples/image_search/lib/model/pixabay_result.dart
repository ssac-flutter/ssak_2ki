import 'package:image_search/model/hits.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pixabay_result.g.dart';

@JsonSerializable()
class PixabayResult {
  int total;
  int totalHits;
  List<Hits> hits;

  PixabayResult(this.total, this.totalHits, this.hits);

  factory PixabayResult.fromJson(Map<String, dynamic> json) => _$PixabayResultFromJson(json);

  Map<String, dynamic> toJson() => _$PixabayResultToJson(this);
}