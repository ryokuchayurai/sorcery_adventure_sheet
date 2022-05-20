import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sorcery_adventure_sheet/domain/historical_point.dart';

part 'monster.freezed.dart';

part 'monster.g.dart';

@freezed
class Monster with _$Monster {
  factory Monster(int skill, HistoricalPoint stamina,
      {String? name,
      String? memo,
      @Default(false) bool isFriend,
      String? group}) = _Monster;

  factory Monster.fromJson(Map<String, dynamic> json) =>
      _$MonsterFromJson(json);
}
