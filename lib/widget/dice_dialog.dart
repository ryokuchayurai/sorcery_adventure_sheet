import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:sorcery_adventure_sheet/service/audio_service.dart';
import 'package:sorcery_adventure_sheet/widget/dice.dart';

class DiceDialog extends StatelessWidget {
  DiceDialog(this.diceNum);

  final int diceNum;

  @override
  Widget build(BuildContext context) {
    AudioService.playDiceSound();

    return SimpleDialog(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (var i = 0; i < diceNum; i++)
              Dice(Random().nextInt(6) + 1, size: 60)
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              child: ElevatedButton(
                child: Text('OK'),
                onPressed: () => Routemaster.of(context).pop(),
              ),
            )
          ],
        )
      ],
    );
  }
}

Future<void> showDiceDialog(BuildContext context, int num) async {
  await showDialog(
      context: context,
      builder: (context) {
        return DiceDialog(num);
      });
}
