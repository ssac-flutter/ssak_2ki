import 'hits.dart';

class PixabayResult {
  PixabayResult({
      this.total, 
      this.totalHits, 
      this.hits,});

  PixabayResult.fromJson(dynamic json) {
    total = json['total'];
    totalHits = json['totalHits'];
    if (json['hits'] != null) {
      hits = [];
      json['hits'].forEach((v) {
        hits.add(Hits.fromJson(v));
      });
    }
  }
  int total;
  int totalHits;
  List<Hits> hits;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = total;
    map['totalHits'] = totalHits;
    if (hits != null) {
      map['hits'] = hits.map((v) => v.toJson()).toList();
    }
    return map;
  }

}