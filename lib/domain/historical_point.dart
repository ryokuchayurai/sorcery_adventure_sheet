import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sorcery_adventure_sheet/domain/history.dart';

part 'historical_point.freezed.dart';

part 'historical_point.g.dart';

@freezed
class HistoricalPoint with _$HistoricalPoint {
  const HistoricalPoint._();

  factory HistoricalPoint(int point,
      {int? max,
      @Default(<History>[]) List<History> histories}) = _HistoricalPoint;

  factory HistoricalPoint.fromJson(Map<String, dynamic> json) =>
      _$HistoricalPointFromJson(json);

  HistoricalPoint newValue({int? point, int? max}) {
    var clone = [...histories];
    clone.add(History(this.point, max: this.max));
    return HistoricalPoint(point ?? this.point,
        max: max ?? this.max, histories: clone);
  }

  List<History> get historyAndCurrent =>
      [...histories, History(point, max: max)];
}
