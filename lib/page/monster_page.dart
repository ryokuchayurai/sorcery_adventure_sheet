import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:routemaster/routemaster.dart';
import 'package:sorcery_adventure_sheet/domain/monster.dart';
import 'package:sorcery_adventure_sheet/gen/assets.gen.dart';
import 'package:sorcery_adventure_sheet/model/adventure_sheet_model.dart';
import 'package:sorcery_adventure_sheet/page/monster_page_model.dart';
import 'package:sorcery_adventure_sheet/widget/alert_dialog.dart';
import 'package:sorcery_adventure_sheet/widget/circle_button.dart';
import 'package:sorcery_adventure_sheet/widget/dice.dart';
import 'package:sorcery_adventure_sheet/widget/dice_dialog.dart';
import 'package:sorcery_adventure_sheet/widget/luck_test_dialog.dart';
import 'package:sorcery_adventure_sheet/widget/monster_dialog.dart';

class MonsterPage extends ConsumerWidget {
  const MonsterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asModel = ref.watch(adventureSheetModelProvider);
    final model = ref.watch(monsterPageModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('怪物対戦表'),
      ),
      body: Container(
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.fromLTRB(5, 8, 5, 5),
              color: Theme.of(context).scaffoldBackgroundColor,
              elevation: 2,
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text('体力点', style: TextStyle(fontSize: 12)),
                        NumberPicker(
                            textStyle: const TextStyle(fontSize: 12),
                            selectedTextStyle: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            itemCount: 3,
                            value: asModel.stamina,
                            minValue: 0,
                            maxValue: asModel.staminaMax,
                            itemHeight: 24,
                            itemWidth: 40,
                            onChanged: (value) =>
                                asModel.setStamina(value, asModel.staminaMax),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.black26),
                            )),
                        Container(
                          height: 70,
                          width: 1,
                          color: Colors.black12,
                        ),
                        const Text('強運点', style: TextStyle(fontSize: 12)),
                        NumberPicker(
                            textStyle: const TextStyle(
                                fontSize: 12, color: Colors.black45),
                            selectedTextStyle: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            itemCount: 3,
                            value: asModel.luck,
                            minValue: 0,
                            maxValue: asModel.luckMax,
                            itemHeight: 24,
                            itemWidth: 40,
                            onChanged: (value) =>
                                asModel.setLuck(value, asModel.luckMax),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.black26),
                            ))
                      ]),
                  Container(
                    height: 1,
                    color: Colors.black12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text('技術点', style: TextStyle(fontSize: 12)),
                          Text('${asModel.skill}',
                              style: TextStyle(fontSize: 24)),
                        ],
                      ),
                      const Text('+'),
                      Column(
                        children: [
                          const Text('装備等による補正',
                              style: TextStyle(fontSize: 10)),
                          NumberPicker(
                              textStyle: const TextStyle(fontSize: 12),
                              selectedTextStyle: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                              itemCount: 3,
                              value: asModel.skillAdd,
                              minValue: -10,
                              maxValue: 10,
                              itemHeight: 26,
                              itemWidth: 40,
                              onChanged: (value) => asModel.setSkillAdd(value),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.black26),
                              )),
                        ],
                      ),
                      const Text('+'),
                      Column(
                        children: [
                          const Text('ダイス', style: TextStyle(fontSize: 12)),
                          _twoDice(model.myD1, model.myD2, onPressed: () {
                            model.rollDice();
                          }),
                        ],
                      ),
                      const Text('='),
                      Column(
                        children: [
                          const Text('攻撃力', style: TextStyle(fontSize: 12)),
                          Text(
                              model.getAttackPoint(
                                  asModel.skill, asModel.skillAdd),
                              style: const TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                child: ListView(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('対戦相手'),
                  CircleIconButton.icon(Icons.add, onPressed: () async {
                    Monster? monster = await showMonsterDialog(context);
                    if (monster != null) {
                      model.addMonster(monster);
                    }
                  }, color: Colors.white, iconColor: Colors.black54)
                ],
              ),
              for (var i = 0; i < model.battleMonsters.length; i++)
                Opacity(
                  opacity: 1,
                  child: Card(
                    color: model.battleMonsters[i].monster.stamina.point <= 0
                        ? const Color.fromARGB(0xFF, 0xCC, 0xCC, 0xCC)
                        : model.battleMonsters[i].monster.isFriend
                            ? const Color.fromARGB(0xFF, 0xE0, 0xFA, 0xE0)
                            : const Color.fromARGB(0xFF, 0xFA, 0xE0, 0xE0),
                    child: Column(
                      children: [
                        Row(children: [
                          const SizedBox(
                            width: 20,
                            height: 34,
                          ),
                          InkWell(
                            onTap: () => model.removeMonster(i),
                            child: const Icon(
                              Icons.delete,
                              color: Colors.black,
                              // size: 14,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text('${model.battleMonsters[i].monster.name}',
                              overflow: TextOverflow.ellipsis),
                        ]),
                        Container(
                          height: 1,
                          color: Colors.black12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                const Text('体力点',
                                    style: TextStyle(fontSize: 12)),
                                const SizedBox(width: 5),
                                NumberPicker(
                                    textStyle: const TextStyle(fontSize: 12),
                                    selectedTextStyle: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    itemCount: 3,
                                    value: model.battleMonsters[i].monster
                                        .stamina.point,
                                    minValue: 0,
                                    maxValue: model
                                        .battleMonsters[i].monster.stamina.max!,
                                    itemHeight: 26,
                                    itemWidth: 40,
                                    onChanged: (value) =>
                                        model.setMonsterStamina(i, value),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: Colors.black26),
                                    )),
                              ],
                            ),
                            Container(
                              height: 60,
                              width: 1,
                              color: Colors.black12,
                            ),
                            Column(
                              children: [
                                const Text('技術点',
                                    style: TextStyle(fontSize: 12)),
                                Text('${model.battleMonsters[i].monster.skill}',
                                    style: const TextStyle(fontSize: 24)),
                              ],
                            ),
                            const Text('+'),
                            Column(
                              children: [
                                const Text('ダイス',
                                    style: TextStyle(fontSize: 12)),
                                _twoDice(model.battleMonsters[i].d1,
                                    model.battleMonsters[i].d2,
                                    onPressed: () => model.rollMonster(i)),
                              ],
                            ),
                            const Text('='),
                            Column(
                              children: [
                                const Text('攻撃力',
                                    style: TextStyle(fontSize: 12)),
                                Text(model.battleMonsters[i].attackPoint,
                                    style: const TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
            ]))
          ],
        ),
      ),
      bottomNavigationBar: Material(
        elevation: 5.0,
        child: Container(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  icon: SvgPicture.asset(Assets.d3),
                  onPressed: () => showDiceDialog(context, 1)),
              IconButton(
                  icon: SvgPicture.asset(Assets.dd),
                  onPressed: () => showDiceDialog(context, 2)),
              IconButton(
                  icon: Icon(Icons.star),
                  onPressed: () => showLuckTestDialog(context)),
              OutlinedButton(
                child: Text('対戦終了'),
                onPressed: () async {
                  bool? result = await showAlertDialog(context, 'おつかれさまでした',
                      '対戦を終了しますか？\n終了すると現在の対戦相手は履歴に移動します。');
                  if (result ?? false) {
                    await model.finishBout();
                    Routemaster.of(context).pop();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _twoDice(int? num1, int? num2, {required VoidCallback onPressed}) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onPressed,
        child: Stack(
          alignment: AlignmentDirectional.topStart,
          children: [
            if (num1 != null)
              Row(
                children: [
                  Dice(
                    num1,
                    size: 20,
                  ),
                  const SizedBox(width: 2),
                  Dice(
                    num2!,
                    size: 20,
                  )
                ],
              ),
            Container(
              width: 55,
              height: 33,
              alignment: Alignment.bottomRight,
              child: const Padding(
                padding: EdgeInsets.all(5),
                child: Icon(Icons.refresh_outlined, size: 18),
              ),
            )
          ],
        ));
  }
}
