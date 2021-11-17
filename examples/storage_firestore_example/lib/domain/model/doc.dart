import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'doc.freezed.dart';

part 'doc.g.dart';

@freezed
class Doc with _$Doc {
  factory Doc({
    required String fileName,
    required String downloadUrl,
  }) = _Doc;

  factory Doc.fromJson(Map<String, dynamic> json) => _$DocFromJson(json);
}