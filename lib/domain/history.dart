import 'package:freezed_annotation/freezed_annotation.dart';

part 'history.freezed.dart';

part 'history.g.dart';

@freezed
class History with _$History {
  factory History(int point, {int? max, String? memo}) = _History;

  factory History.fromJson(Map<String, dynamic> json) =>
      _$HistoryFromJson(json);
}
