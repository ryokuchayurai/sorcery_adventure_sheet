import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:sorcery_adventure_sheet/model/adventure_sheet_model.dart';
import 'package:sorcery_adventure_sheet/service/audio_service.dart';
import 'package:sorcery_adventure_sheet/widget/dice.dart';

class LuckTestDialog extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var model = ref.read(adventureSheetModelProvider);
    int luck = model.luck;
    if (luck <= 0) {
      return SimpleDialog(
        children: [
          Text('強運点がありません', textAlign: TextAlign.center),
          SizedBox(height: 20),
          TextButton(
              onPressed: () => Routemaster.of(context).pop(),
              child: Text('閉じる')),
        ],
      );
    }

    AudioService.playDiceSound();

    int d1 = Random().nextInt(6) + 1;
    int d2 = Random().nextInt(6) + 1;
    bool result = luck >= (d1 + d2);

    return SimpleDialog(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('強運点'),
            SizedBox(width: 10),
            Text(
              '$luck',
              style: TextStyle(fontSize: 60),
            )
          ],
        ),
        Text('VS', textAlign: TextAlign.center),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Dice(d1, size: 60),
            SizedBox(width: 10),
            Dice(d2, size: 60),
          ],
        ),
        SizedBox(height: 20),
        Text('結果',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.black38)),
        Text(result ? '吉' : '凶',
            style: TextStyle(
                fontSize: 60, color: result ? Colors.green : Colors.red),
            textAlign: TextAlign.center),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 10),
            TextButton(
                onPressed: () => Routemaster.of(context).pop(),
                child: Text('閉じる')),
            SizedBox(width: 10),
            Expanded(
                child: ElevatedButton(
              child: Text(
                '強運点を1減らして閉じる',
                textAlign: TextAlign.center,
              ),
              onPressed: () async {
                model.setLuck(luck - 1, model.luckMax);
                Routemaster.of(context).pop();
              },
            )),
            SizedBox(width: 10),
          ],
        )
      ],
    );
  }
}

Future<void> showLuckTestDialog(BuildContext context) async {
  await showDialog(
      context: context,
      builder: (context) {
        return LuckTestDialog();
      });
}
