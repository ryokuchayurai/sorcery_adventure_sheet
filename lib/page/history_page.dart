import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorcery_adventure_sheet/domain/history.dart';
import 'package:sorcery_adventure_sheet/domain/monster.dart';
import 'package:sorcery_adventure_sheet/model/adventure_sheet_model.dart';

class HistoryPage extends ConsumerWidget {
  late AdventureSheetModel _model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _model = ref.watch(adventureSheetModelProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('履歴'),
          actions: [],
        ),
        body: ListView(
          children: [
            _statusHistory('体力点', _model.staminaHistory, 180),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(child: _statusHistory('強運点', _model.luckHistory, 120)),
                Expanded(
                    child: _statusHistory('技術点', _model.skillHistory, 120)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                    child: _statusHistory('金貨', _model.goldsHistory, 120,
                        hasMax: false)),
                Expanded(
                    child: _statusHistory('食糧', _model.provisionsHistory, 120,
                        hasMax: false)),
              ],
            ),
            _defeatedMonsters()
          ],
        ));
  }

  Widget _statusHistory(String title, List<History>? historyList, double height,
      {bool hasMax = true}) {
    if (historyList == null) return Text('履歴がありません');

    final seriesList = [
      charts.Series(
          id: 'point',
          domainFn: (History history, index) => index!,
          measureFn: (History history, index) => history.point,
          data: historyList),
      if (hasMax)
        charts.Series(
            id: 'max',
            domainFn: (History history, index) => index!,
            measureFn: (History history, index) => history.max,
            data: historyList)
    ];

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(title),
        Container(
            width: double.infinity,
            height: height,
            color: const Color.fromARGB(0xFF, 0xFE, 0xFE, 0xF0),
            child: charts.LineChart(seriesList))
      ],
    );
  }

  Widget _defeatedMonsters() {
    var monsterWidgets = <Widget>[];
    String? group;
    for (final monster in _model.defeatedMonsters) {
      if (group != null && group != monster.group) {
        monsterWidgets.add(
          const SizedBox(height: 10),
        );
      }
      monsterWidgets.add(_monsterTile(monster));
      group = monster.group;
    }

    return Column(
      children: [
        const SizedBox(height: 20),
        const Text('対戦相手'),
        ...monsterWidgets
      ],
    );
  }
}

Widget _monsterTile(Monster monster) {
  return Card(
    color: monster.isFriend
        ? const Color.fromARGB(0xFF, 0xF0, 0xFE, 0xF0)
        : const Color.fromARGB(0xFF, 0xFE, 0xF0, 0xF0),
    child: Row(
      children: [
        const SizedBox(height: 40, width: 20),
        Expanded(
            child: Text(
          '${monster.name}',
          style: TextStyle(fontSize: 18),
        )),
        const Text('技術点 ', style: TextStyle(fontSize: 12)),
        Text(
          '${monster.skill}',
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(width: 10),
        const Text('体力点 ', style: TextStyle(fontSize: 12)),
        Text('${monster.stamina.max}', style: const TextStyle(fontSize: 18)),
        const Text(' > ', style: TextStyle(fontSize: 12)),
        Text('${monster.stamina.point}', style: const TextStyle(fontSize: 18)),
        const SizedBox(width: 10),
      ],
    ),
  );
}
