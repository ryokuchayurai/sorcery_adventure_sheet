import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorcery_adventure_sheet/domain/adventure_sheet.dart';
import 'package:sorcery_adventure_sheet/domain/historical_point.dart';
import 'package:sorcery_adventure_sheet/domain/history.dart';
import 'package:sorcery_adventure_sheet/domain/item.dart';
import 'package:sorcery_adventure_sheet/domain/monster.dart';
import 'package:sorcery_adventure_sheet/domain/role.dart';
import 'package:sorcery_adventure_sheet/repository/adventure_sheet_repository.dart';

final adventureSheetModelProvider = ChangeNotifierProvider(
  (ref) {
    final adventureSheetRepository =
        ref.watch(adventureSheetRepositoryProvider);
    return AdventureSheetModel(adventureSheetRepository);
  },
);

class AdventureSheetModel extends ChangeNotifier {
  AdventureSheetModel(this._adventureSheetRepository) {
    load();
  }

  final AdventureSheetRepository _adventureSheetRepository;

  AdventureSheet? _adventureSheet;

  bool get created => _adventureSheet != null;

  int get skill => _adventureSheet?.skill?.point ?? 0;

  int get skillMax => _adventureSheet?.skill?.max ?? 0;

  int get skillAdd => _adventureSheet?.skillAdd ?? 0;

  List<History>? get skillHistory => _adventureSheet?.skill?.historyAndCurrent;

  int get stamina => _adventureSheet?.stamina?.point ?? 0;

  int get staminaMax => _adventureSheet?.stamina?.max ?? 0;

  List<History>? get staminaHistory =>
      _adventureSheet?.stamina?.historyAndCurrent;

  int get luck => _adventureSheet?.luck?.point ?? 0;

  int get luckMax => _adventureSheet?.luck?.max ?? 0;

  List<History>? get luckHistory => _adventureSheet?.luck?.historyAndCurrent;

  int get golds => _adventureSheet?.golds?.point ?? 0;

  List<History>? get goldsHistory => _adventureSheet?.golds?.historyAndCurrent;

  int get provisions => _adventureSheet?.provisions?.point ?? 0;

  List<History>? get provisionsHistory =>
      _adventureSheet?.provisions?.historyAndCurrent;

  bool get libra => _adventureSheet?.libra ?? false;

  List<Item> get equipments => _adventureSheet?.equipments ?? [];

  List<Item> get status => _adventureSheet?.status ?? [];

  List<Item> get notes => _adventureSheet?.notes ?? [];

  List<Monster> get monsters => _adventureSheet?.monsters ?? [];

  List<Monster> get defeatedMonsters => _adventureSheet?.defeatedMonsters ?? [];

  bool _showDeleteEquipment = true;

  bool get showDeleteEquipment => _showDeleteEquipment;

  set showDeleteEquipment(bool? value) {
    _showDeleteEquipment = value ?? true;
    notifyListeners();
  }

  bool _showDeleteStatus = true;

  bool get showDeleteStatus => _showDeleteStatus;

  set showDeleteStatus(bool? value) {
    _showDeleteStatus = value ?? true;
    notifyListeners();
  }

  bool _showDeleteNotes = true;

  bool get showDeleteNotes => _showDeleteNotes;

  set showDeleteNotes(bool? value) {
    _showDeleteNotes = value ?? true;
    notifyListeners();
  }

  Future<Set<String>> getList() async {
    return (await _adventureSheetRepository.list()).toList().reversed.toSet();
  }

  Future<void> load({String? name}) async {
    if (name == null) {
      _adventureSheet = await _adventureSheetRepository.load();
    } else {
      _adventureSheet = await _adventureSheetRepository.loadAs(name);
      _adventureSheet = _adventureSheet?.copyWith(sheetName: name);
    }

    notifyListeners();
  }

  Future<bool> save({String? name, bool? force}) async {
    if (_adventureSheet == null) return false;

    if (name == null) {
      await _adventureSheetRepository.save(_adventureSheet!);
    } else {
      final list = await getList();
      if (!(force ?? false) && list.contains(name)) {
        return false;
      }

      _adventureSheet = _adventureSheet?.copyWith(sheetName: name);
      await _adventureSheetRepository.saveAs(_adventureSheet!, name);
      await _adventureSheetRepository.save(_adventureSheet!);
    }
    notifyListeners();
    return true;
  }

  Future<void> reset() async {
    _adventureSheetRepository.remove();
  }

  Future<void> removeAs(String name) async {
    await _adventureSheetRepository.removeAs(name);
    notifyListeners();
  }

  Future<void> rename(String oldName, String newName) async {
    await _adventureSheetRepository.rename(oldName, newName);
    notifyListeners();
  }

  Future<void> create(Role role, int skill, int stamina, int luck,
      {int golds = 20, int provisions = 2}) async {
    _adventureSheet = AdventureSheet(
        role: role,
        skill: HistoricalPoint(skill, max: skill),
        stamina: HistoricalPoint(stamina, max: stamina),
        luck: HistoricalPoint(luck, max: luck),
        golds: HistoricalPoint(golds),
        provisions: HistoricalPoint(provisions),
        equipments: <Item>[Item('剣', memo: '初期装備')]);
    await save();
  }

  Future<void> setSkill(int point, int max) async {
    if (point == skill && max == skillMax) return;
    _adventureSheet = _adventureSheet?.copyWith(
        skill: _adventureSheet?.skill?.newValue(point: point, max: max));
    await save();
  }

  Future<void> setSkillAdd(int point) async {
    if (point == skillAdd) return;
    _adventureSheet = _adventureSheet?.copyWith(skillAdd: point);
    await save();
  }

  Future<void> setStamina(int point, int max) async {
    if (point == stamina && max == staminaMax) return;
    _adventureSheet = _adventureSheet?.copyWith(
        stamina: _adventureSheet?.stamina?.newValue(point: point, max: max));
    await save();
  }

  Future<void> setLuck(int point, int max) async {
    if (point == luck && max == luckMax) return;
    _adventureSheet = _adventureSheet?.copyWith(
        luck: _adventureSheet?.luck?.newValue(point: point, max: max));
    await save();
  }

  Future<void> setGolds(int point) async {
    if (point == golds) return;
    _adventureSheet = _adventureSheet?.copyWith(
        golds: _adventureSheet?.golds?.newValue(point: point));
    await save();
  }

  Future<void> setProvisions(int point) async {
    if (point == provisions) return;
    _adventureSheet = _adventureSheet?.copyWith(
        provisions: _adventureSheet?.provisions?.newValue(point: point));
    await save();
  }

  Future<void> setLibra(bool value) async {
    _adventureSheet = _adventureSheet?.copyWith(libra: value);
    notifyListeners();
    await save();
  }

  Future<void> addEquipment(Item equipment) async {
    List<Item> equipments = [equipment, ...(_adventureSheet?.equipments ?? [])];
    _adventureSheet = _adventureSheet?.copyWith(equipments: equipments);
    await save();
  }

  Future<void> editEquipment(int index, Item item) async {
    List<Item> equipments = [...(_adventureSheet?.equipments ?? [])];
    equipments[index] = item;
    _adventureSheet = _adventureSheet?.copyWith(equipments: equipments);
    await save();
  }

  Future<void> toggleEquipment(Item equipment) async {
    List<Item> equipments = _adventureSheet?.equipments?.map((e) {
          if (e != equipment) return e;
          return e.copyWith(isDeleted: !e.isDeleted);
        }).toList() ??
        [];

    _adventureSheet = _adventureSheet?.copyWith(equipments: equipments);
    await save();
  }

  Future<void> removeEquipment(Item equipment) async {
    List<Item> equipments = _adventureSheet?.equipments
            ?.where((element) => element != equipment)
            .toList() ??
        [];
    _adventureSheet = _adventureSheet?.copyWith(equipments: equipments);
    await save();
  }

  Future<void> reorderEquipment(int oldIndex, int newIndex) async {
    List<Item> equipments = [...(_adventureSheet?.equipments ?? [])];
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final item = equipments.removeAt(oldIndex);
    equipments.insert(newIndex, item);
    _adventureSheet = _adventureSheet?.copyWith(equipments: equipments);
    notifyListeners();
    await save();
  }

  Future<void> addStatus(Item item) async {
    List<Item> status = [item, ...(_adventureSheet?.status ?? [])];
    _adventureSheet = _adventureSheet?.copyWith(status: status);
    await save();
  }

  Future<void> toggleStatus(Item item) async {
    List<Item> status = _adventureSheet?.status?.map((e) {
          if (e != item) return e;
          return e.copyWith(isDeleted: !e.isDeleted);
        }).toList() ??
        [];

    _adventureSheet = _adventureSheet?.copyWith(status: status);
    await save();
  }

  Future<void> editStatus(int index, Item item) async {
    List<Item> status = [...(_adventureSheet?.status ?? [])];
    status[index] = item;
    _adventureSheet = _adventureSheet?.copyWith(status: status);
    await save();
  }

  Future<void> removeStatus(Item item) async {
    List<Item> status =
        _adventureSheet?.status?.where((element) => element != item).toList() ??
            [];
    _adventureSheet = _adventureSheet?.copyWith(status: status);
    await save();
  }

  Future<void> reorderStatus(int oldIndex, int newIndex) async {
    List<Item> status = [...(_adventureSheet?.status ?? [])];
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final item = status.removeAt(oldIndex);
    status.insert(newIndex, item);
    _adventureSheet = _adventureSheet?.copyWith(status: status);
    notifyListeners();
    await save();
  }

  Future<void> addNotes(Item item) async {
    List<Item> notes = [item, ...(_adventureSheet?.notes ?? [])];
    _adventureSheet = _adventureSheet?.copyWith(notes: notes);
    await save();
  }

  Future<void> editNotes(int index, Item item) async {
    List<Item> notes = [...(_adventureSheet?.notes ?? [])];
    notes[index] = item;
    _adventureSheet = _adventureSheet?.copyWith(notes: notes);
    await save();
  }

  Future<void> toggleNotes(Item item) async {
    List<Item> notes = _adventureSheet?.notes?.map((e) {
          if (e != item) return e;
          return e.copyWith(isDeleted: !e.isDeleted);
        }).toList() ??
        [];

    _adventureSheet = _adventureSheet?.copyWith(notes: notes);
    await save();
  }

  Future<void> removeNotes(Item item) async {
    List<Item> notes =
        _adventureSheet?.notes?.where((element) => element != item).toList() ??
            [];
    _adventureSheet = _adventureSheet?.copyWith(notes: notes);
    await save();
  }

  Future<void> reorderNotes(int oldIndex, int newIndex) async {
    List<Item> notes = [...(_adventureSheet?.status ?? [])];
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final item = notes.removeAt(oldIndex);
    notes.insert(newIndex, item);
    _adventureSheet = _adventureSheet?.copyWith(notes: notes);
    notifyListeners();
    await save();
  }

  Future<void> setMonsters(List<Monster> monsters) async {
    _adventureSheet = _adventureSheet?.copyWith(monsters: monsters);
    await save();
  }

  Future<void> addDefeatedMonsters(List<Monster> monsters) async {
    List<Monster> defeatedMonsters = [
      ...(_adventureSheet?.defeatedMonsters ?? []),
      ...monsters
    ];
    _adventureSheet =
        _adventureSheet?.copyWith(defeatedMonsters: defeatedMonsters);
    await save();
  }

  String? get sheetName => _adventureSheet?.sheetName;

  String get sheetNameEllipsis => _adventureSheet?.sheetName == null
      ? ''
      : _adventureSheet!.sheetName!.length > 8
          ? _adventureSheet!.sheetName!
              .replaceRange(8, _adventureSheet!.sheetName!.length, '...')
          : _adventureSheet!.sheetName!;
}
