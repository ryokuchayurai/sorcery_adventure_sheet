import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorcery_adventure_sheet/domain/monster.dart';
import 'package:sorcery_adventure_sheet/model/adventure_sheet_model.dart';
import 'package:sorcery_adventure_sheet/service/audio_service.dart';

final monsterPageModelProvider = ChangeNotifierProvider((ref) {
  return MonsterPageModel(ref);
});

class MonsterPageModel extends ChangeNotifier {
  MonsterPageModel(this.ref) {
    _loadMonster();
  }

  final ChangeNotifierProviderRef ref;

  int? myD1;
  int? myD2;
  List<BattleMonster> battleMonsters = [];

  void _loadMonster() {
    battleMonsters.clear();
    battleMonsters.addAll(ref
        .read(adventureSheetModelProvider)
        .monsters
        .map((e) => BattleMonster(e))
        .toList());
  }

  void rollDice() {
    AudioService.playDiceSound();
    myD1 = Random().nextInt(6) + 1;
    myD2 = Random().nextInt(6) + 1;
    notifyListeners();
  }

  String getAttackPoint(int skill, int add) {
    if (myD1 == null) return '?';
    return (skill + add + myD1! + myD2!).toString();
  }

  void addMonster(Monster monster) {
    final m = monster.copyWith(
        name: monster.name ?? '対戦相手${battleMonsters.length + 1}');
    battleMonsters.add(BattleMonster(m));
    _saveMonster();
  }

  void removeMonster(int index) {
    battleMonsters.removeAt(index);
    _saveMonster();
  }

  void rollMonster(int index) {
    AudioService.playDiceSound();
    battleMonsters[index].d1 = Random().nextInt(6) + 1;
    battleMonsters[index].d2 = Random().nextInt(6) + 1;
    notifyListeners();
  }

  void setMonsterStamina(int index, int value) {
    battleMonsters[index].monster = battleMonsters[index].monster.copyWith(
        stamina: battleMonsters[index].monster.stamina.newValue(point: value));
    _saveMonster();
  }

  void _saveMonster() {
    ref
        .read(adventureSheetModelProvider)
        .setMonsters(battleMonsters.map((e) => e.monster).toList());
    notifyListeners();
  }

  Future<void> finishBout() async {
    var groupeId = DateTime.now().millisecondsSinceEpoch;

    myD1 = null;
    myD2 = null;
    await ref.read(adventureSheetModelProvider).addDefeatedMonsters(
        battleMonsters
            .map((e) => e.monster.copyWith(group: groupeId.toString()))
            .toList());
    await ref.read(adventureSheetModelProvider).setMonsters([]);
    battleMonsters.clear();
  }
}

class BattleMonster {
  BattleMonster(this.monster);

  Monster monster;
  int? d1;
  int? d2;

  String get attackPoint =>
      d1 == null ? '?' : (monster.skill + d1! + d2!).toString();
}
