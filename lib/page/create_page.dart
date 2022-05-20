import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:sorcery_adventure_sheet/domain/role.dart';
import 'package:sorcery_adventure_sheet/model/adventure_sheet_model.dart';
import 'package:sorcery_adventure_sheet/page/create_page_model.dart';
import 'package:sorcery_adventure_sheet/widget/dice.dart';
import 'package:url_launcher/url_launcher.dart';

class CreatePage extends ConsumerWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(createPageModelProvider);

    return Scaffold(
        appBar: AppBar(
          title: Text('冒険記録紙 作成'),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                icon: const Icon(Icons.info_outline),
                onPressed: () =>
                    launch('/info.html')),
          ],
        ),
        body: Column(
          children: [
            Column(
              children: [
                Text('役柄',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                RadioListTile<Role>(
                  title: Text('戦士(初級)'),
                  value: Role.warrior,
                  groupValue: model.role,
                  onChanged: model.setRole,
                ),
                RadioListTile<Role>(
                  title: Text('魔法使い(上級)'),
                  value: Role.wizard,
                  groupValue: model.role,
                  onChanged: model.setRole,
                ),
                if (model.role != null && model.skillD1 == null)
                  OutlinedButton(
                      onPressed: () {
                        model.rollDice();
                      },
                      child: Text('技術点、体力点、強運点を決める')),
                if (model.skillD1 != null) ...[
                  Divider(),
                  Column(
                    children: [
                      Text('技術点',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(children: [
                              Text('固定値'),
                              Text(
                                '${model.skillFix}',
                                style: TextStyle(fontSize: 18),
                              )
                            ]),
                            SizedBox(width: 10),
                            Text('+'),
                            SizedBox(width: 10),
                            Column(children: [
                              Text('ダイス'),
                              Dice(model.skillD1!, size: 24),
                            ]),
                            SizedBox(width: 10),
                            Text('='),
                            SizedBox(width: 10),
                            Text('${model.skill}',
                                style: TextStyle(fontSize: 40)),
                          ])
                    ],
                  ),
                  Divider(),
                  Column(
                    children: [
                      Text('体力点',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(children: [
                              Text('固定値'),
                              Text(
                                '${model.staminaFix}',
                                style: TextStyle(fontSize: 18),
                              )
                            ]),
                            SizedBox(width: 10),
                            Text('+'),
                            SizedBox(width: 10),
                            Column(children: [
                              Text('ダイス'),
                              Row(
                                children: [
                                  Dice(model.staminaD1!, size: 24),
                                  SizedBox(width: 5),
                                  Dice(model.staminaD2!, size: 24),
                                ],
                              )
                            ]),
                            SizedBox(width: 10),
                            Text('='),
                            SizedBox(width: 10),
                            Text('${model.stamina}',
                                style: TextStyle(fontSize: 40)),
                          ])
                    ],
                  ),
                  Divider(),
                  Column(
                    children: [
                      Text('強運点',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(children: [
                              Text('固定値'),
                              Text(
                                '${model.luckFix}',
                                style: TextStyle(fontSize: 18),
                              )
                            ]),
                            SizedBox(width: 10),
                            Text('+'),
                            SizedBox(width: 10),
                            Column(children: [
                              Text('ダイス'),
                              Dice(model.luckD1!, size: 24),
                            ]),
                            SizedBox(width: 10),
                            Text('='),
                            SizedBox(width: 10),
                            Text('${model.luck}',
                                style: TextStyle(fontSize: 40)),
                          ])
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                          onPressed: () {
                            model.rollDice();
                          },
                          child: Text('作り直す')),
                      SizedBox(width: 10),
                      ElevatedButton(
                          onPressed: () async {
                            await ref.read(adventureSheetModelProvider).create(
                                model.role!,
                                model.skill,
                                model.stamina,
                                model.luck);
                            Routemaster.of(context).replace('/main');
                          },
                          child: Text('これで作成する')),
                    ],
                  )
                ]
              ],
            )
          ],
        ));
  }
}
