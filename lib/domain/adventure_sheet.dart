import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sorcery_adventure_sheet/domain/historical_point.dart';
import 'package:sorcery_adventure_sheet/domain/item.dart';
import 'package:sorcery_adventure_sheet/domain/monster.dart';
import 'package:sorcery_adventure_sheet/domain/role.dart';

part 'adventure_sheet.freezed.dart';

part 'adventure_sheet.g.dart';

@freezed
class AdventureSheet with _$AdventureSheet {
  factory AdventureSheet({
    String? sheetName,
    Role? role,
    HistoricalPoint? skill,
    int? skillAdd,
    HistoricalPoint? stamina,
    HistoricalPoint? luck,
    HistoricalPoint? golds,
    HistoricalPoint? provisions,
    bool? libra,
    List<Item>? equipments,
    List<Item>? status,
    List<Item>? notes,
    List<Monster>? monsters,
    List<Monster>? defeatedMonsters,
  }) = _AdventureSheet;

  factory AdventureSheet.fromJson(Map<String, dynamic> json) =>
      _$AdventureSheetFromJson(json);
}
