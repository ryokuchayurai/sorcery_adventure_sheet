import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:sorcery_adventure_sheet/model/adventure_sheet_model.dart';
import 'package:sorcery_adventure_sheet/widget/alert_dialog.dart';
import 'package:sorcery_adventure_sheet/widget/save_dialog.dart';

class LoadDialog extends ConsumerStatefulWidget {
  @override
  _LoadDialogState createState() => _LoadDialogState();
}

class _LoadDialogState extends ConsumerState<LoadDialog> {
  late AdventureSheetModel _model;

  @override
  Widget build(BuildContext context) {
    _model = ref.watch(adventureSheetModelProvider);

    return SimpleDialog(
      title: Text('冒険記録紙 読み込み'),
      children: [
        Column(
          children: [
            FutureBuilder(
              future: _model.getList(),
              builder: (context, AsyncSnapshot<Set<String>> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.isNotEmpty) {
                    return Container(
                        height: 260,
                        width: 220,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12)),
                        child: ListView(
                          children: [
                            for (var name in snapshot.data!) _listTile(name)
                          ],
                        ));
                  } else {
                    return Text('冒険記録紙がありません');
                  }
                }
                return const Text('Loading...');
              },
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        TextButton(
            onPressed: () {
              Routemaster.of(context).pop();
            },
            child: Text('Cancel'))
      ],
    );
  }

  Widget _listTile(String name) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.black26))),
      // child: Expanded(
      child: InkWell(
        child: Row(
          children: [
            const SizedBox(width: 5, height: 30),
            InkWell(
              child: Icon(Icons.delete, color: Colors.black45),
              onTap: () async {
                final result =
                    await showAlertDialog(context, '確認', '削除してよろしいですか？');
                if (result ?? false) {
                  _model.removeAs(name);
                }
              },
            ),
            const SizedBox(width: 5, height: 30),
            InkWell(
              child: Icon(Icons.edit, color: Colors.black45),
              onTap: () async {
                final result = await showSaveDialog(context, name: name);
                if (result != null) {
                  final list = await _model.getList();
                  if (list.contains(result)) {
                    showAlertDialog(context, '名前を変更できません', 'すでに同じ名前の冒険記録紙があります',
                        onlyOk: true);
                  } else {
                    _model.rename(name, result);
                  }
                }
              },
            ),
            const SizedBox(width: 5, height: 30),
            Expanded(child: Text(name))
          ],
        ),
        onTap: () async {
          final result =
              await showAlertDialog(context, '確認', '$name を読み込みます。\nよろしいですか？');
          if (result ?? false) {
            _model.load(name: name);
            Routemaster.of(context).pop();
          }
        },
      ),
      // ),
    );
  }
}

Future<String?> showLoadDialog(BuildContext context) async {
  return await showDialog<String?>(
      context: context,
      builder: (context) {
        return LoadDialog();
      });
}
