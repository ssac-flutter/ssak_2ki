import 'hits.dart';

class PixabayResult {
  late int total;
  late int totalHits;
  late List<Hits> hits;

  PixabayResult({
      required this.total,
      required this.totalHits,
      required this.hits,});

  PixabayResult.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    totalHits = json['totalHits'];
    if (json['hits'] != null) {
      hits = [];
      json['hits'].forEach((v) {
        hits.add(Hits.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = total;
    map['totalHits'] = totalHits;
    map['hits'] = hits.map((v) => v.toJson()).toList();
    return map;
  }

}