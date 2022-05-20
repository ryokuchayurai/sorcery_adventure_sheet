import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorcery_adventure_sheet/domain/role.dart';
import 'package:sorcery_adventure_sheet/service/audio_service.dart';

final createPageModelProvider =
    ChangeNotifierProvider((ref) => CreatePageModel());

class CreatePageModel extends ChangeNotifier {
  Role? role;

  int? skillFix;
  int? skillD1;

  int get skill => skillFix! + skillD1!;

  int staminaFix = 12;
  int? staminaD1;
  int? staminaD2;

  int get stamina => staminaFix + staminaD1! + staminaD2!;

  int luckFix = 6;
  int? luckD1;

  int get luck => luckFix + luckD1!;

  void setRole(Role? role) {
    this.role = role;
    notifyListeners();
  }

  void rollDice() {
    AudioService.playDiceSound();

    skillFix = role == Role.warrior ? 6 : 4;
    skillD1 = Random().nextInt(6) + 1;
    staminaD1 = Random().nextInt(6) + 1;
    staminaD2 = Random().nextInt(6) + 1;
    luckD1 = Random().nextInt(6) + 1;
    notifyListeners();
  }

  void set({int? skillD1, int? staminaD1, int? staminaD2, int? luckD1}) {
    this.skillD1 = skillD1 ?? this.skillD1;
    this.staminaD1 = staminaD1 ?? this.staminaD1;
    this.staminaD2 = staminaD2 ?? this.staminaD2;
    this.luckD1 = luckD1 ?? this.luckD1;
    notifyListeners();
  }
}
