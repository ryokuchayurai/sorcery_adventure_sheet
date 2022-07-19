import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:routemaster/routemaster.dart';
import 'package:sorcery_adventure_sheet/domain/item.dart';
import 'package:sorcery_adventure_sheet/gen/assets.gen.dart';
import 'package:sorcery_adventure_sheet/model/adventure_sheet_model.dart';
import 'package:sorcery_adventure_sheet/widget/alert_dialog.dart';
import 'package:sorcery_adventure_sheet/widget/dice_dialog.dart';
import 'package:sorcery_adventure_sheet/widget/item_dialog.dart';
import 'package:sorcery_adventure_sheet/widget/load_dialog.dart';
import 'package:sorcery_adventure_sheet/widget/luck_test_dialog.dart';
import 'package:sorcery_adventure_sheet/widget/memo_dialog.dart';
import 'package:sorcery_adventure_sheet/widget/point_picker_dialog.dart';
import 'package:sorcery_adventure_sheet/widget/save_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends ConsumerWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(adventureSheetModelProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('冒険記録紙'),
        actions: [_appBarMenu(context, model)],
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
                IconButton(
                    icon: Icon(Icons.note_outlined),
                    onPressed: () => showMemoDialog(context)),
                IconButton(
                    icon: Icon(Icons.whatshot),
                    onPressed: () => Routemaster.of(context).push('/monster')),
              ],
            ),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _status(context, '技術点', model.skill,
                  max: model.skillMax,
                  pointSetter: (newPoint, newMax) =>
                      model.setSkill(newPoint, newMax!)),
              _status(context, '体力点', model.stamina,
                  max: model.staminaMax,
                  pointSetter: (newPoint, newMax) =>
                      model.setStamina(newPoint, newMax!)),
              _status(context, '強運点', model.luck,
                  max: model.luckMax,
                  pointSetter: (newPoint, newMax) =>
                      model.setLuck(newPoint, newMax!)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _status(context, '金貨', model.golds,
                  pointSetter: (newPoint, newMax) => model.setGolds(newPoint)),
              _status(context, '食糧', model.provisions,
                  pointSetter: (newPoint, newMax) =>
                      model.setProvisions(newPoint)),
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 45,
                            child: Switch(
                              value: model.libra,
                              onChanged: (value) => model.setLibra(value),
                            ),
                          ),
                          const Text('リブラ\nの助け',
                              style: TextStyle(fontSize: 12),
                              overflow: TextOverflow.ellipsis)
                        ],
                      )))
            ],
          ),
          Expanded(
              child: Container(
            color: const Color.fromARGB(0xFF, 0xF9, 0xF9, 0xF3),
            child: _tabController(context, model),
          ))
        ],
      ),
    );
  }

  Widget _appBarMenu(BuildContext context, AdventureSheetModel model) {
    return PopupMenuButton(
        icon: const Icon(Icons.menu),
        itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              PopupMenuItem(
                child: const ListTile(
                  leading: Icon(Icons.save),
                  title: Text('名前を付けて保存'),
                ),
                onTap: () {
                  Future<void>.delayed(const Duration(), () async {
                    var name = await showSaveDialog(context);
                    if (name != null) {
                      final saveResult = await model.save(name: name);
                      if (!saveResult) {
                        final alertResult = await showAlertDialog(
                            context, '確認', '同じ名前の冒険記録紙があります。\n上書きしますか？');
                        if (alertResult ?? false) {
                          await model.save(name: name, force: true);
                        }
                      }
                    }
                  });
                },
              ),
              if (model.sheetName != null)
                PopupMenuItem(
                  child: ListTile(
                    leading: const Icon(Icons.save),
                    title: Text(
                      '${model.sheetNameEllipsis} に上書き保存',
                    ),
                  ),
                  onTap: () {
                    Future<void>.delayed(const Duration(), () async {
                      await model.save(name: model.sheetName, force: true);
                    });
                  },
                ),
              PopupMenuItem(
                child: const ListTile(
                  leading: Icon(Icons.save_outlined),
                  title: Text('読み込み'),
                ),
                onTap: () {
                  Future<void>.delayed(const Duration(), () async {
                    showLoadDialog(context);
                  });
                },
              ),
              PopupMenuItem(
                child: const ListTile(
                  leading: Icon(Icons.history),
                  title: Text('履歴'),
                ),
                onTap: () => Routemaster.of(context).push('/history'),
              ),
              const PopupMenuDivider(),
              PopupMenuItem(
                child: const ListTile(
                  leading: Icon(Icons.cleaning_services_rounded),
                  title: Text('最初から'),
                ),
                onTap: () {
                  Future<void>.delayed(const Duration(), () async {
                    var value = await showAlertDialog(
                        context, '確認', '現在の冒険記録紙を削除して作り直しますか？');
                    if (value ?? false) {
                      model.reset();
                      Routemaster.of(context).replace('/');
                    }
                  });
                },
              ),
              PopupMenuItem(
                child: const ListTile(
                  leading: Icon(Icons.help),
                  title: Text('このアプリについて'),
                ),
                onTap: () => launch('./info.html'),
              ),
            ]);
  }

  Widget _status(BuildContext context, String name, int point,
      {int? max, required Function(int newPoint, int? newMax) pointSetter}) {
    var label = '$point';
    if (max != null) {
      label += ' / $max';
    }
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(5),
      child: OutlinedButton(
        onPressed: () async {
          var result = await showPointPickerDialog(context, name, point,
              max: max, editableMax: max != null ? true : false);
          if (result != null) {
            pointSetter(result.point, result.max);
          }
        },
        child: SizedBox(
            height: 50,
            child: Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(name, style: TextStyle(fontSize: 12)),
                Text(label,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ))),
      ),
    ));
  }

  Widget _tabController(BuildContext context, AdventureSheetModel model) {
    return DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(child: _tabBar()),
            Expanded(
                child: TabBarView(children: <Widget>[
              _tabBody(context, '装備および工芸品', model.equipments,
                  model.showDeleteEquipment,
                  reorder: model.reorderEquipment,
                  addItem: model.addEquipment, showDeleteChange: (value) {
                model.showDeleteEquipment = value;
              },
                  editItem: model.editEquipment,
                  toggleItem: model.toggleEquipment,
                  removeItem: model.removeEquipment),
              _tabBody(
                  context, '報償、罰、呪いその他', model.status, model.showDeleteStatus,
                  reorder: model.reorderStatus,
                  addItem: model.addStatus, showDeleteChange: (value) {
                model.showDeleteStatus = value;
              },
                  editItem: model.editStatus,
                  toggleItem: model.toggleStatus,
                  removeItem: model.removeStatus),
              _tabBody(
                  context, '手がかりおよび注意点', model.notes, model.showDeleteNotes,
                  reorder: model.reorderNotes,
                  addItem: model.addNotes, showDeleteChange: (value) {
                model.showDeleteNotes = value;
              },
                  editItem: model.editNotes,
                  toggleItem: model.toggleNotes,
                  removeItem: model.removeNotes),
            ]))
          ],
        ));
  }

  Widget _tabBar() {
    return const TabBar(
      labelColor: Colors.black45,
      tabs: [
        Tab(
          child: Text(
            '装備および工芸品',
            style: TextStyle(fontSize: 12),
          ),
        ),
        Tab(
            child: Text(
          '報償、罰、呪いその他',
          style: TextStyle(fontSize: 12),
        )),
        Tab(
            child: Text(
          '手がかりおよび注意点',
          style: TextStyle(fontSize: 12),
        )),
      ],
    );
  }

  Widget _tabBody(
    BuildContext context,
    String name,
    List<Item> items,
    bool showDelete, {
    required Function(int oldIndex, int newIndex) reorder,
    required Function(Item item) addItem,
    required Function(bool? value) showDeleteChange,
    required Function(int index, Item item) editItem,
    required Function(Item item) toggleItem,
    required Function(Item item) removeItem,
  }) {
    return ReorderableListView(
      buildDefaultDragHandles: false,
      onReorder: (oldIndex, newIndex) async =>
          await reorder(oldIndex, newIndex),
      children: [
        for (var i = 0; i < items.length; i++)
          _itemListTile(context, i, name, items[i], showDelete, editItem,
              toggleItem, removeItem),
      ],
      header: Container(
        decoration: const BoxDecoration(
            border: Border(
          bottom: BorderSide(width: 1, color: Colors.black12),
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () async {
                var item = await showDialog(
                    context: context,
                    builder: (context) {
                      return ItemDialog(name);
                    });
                if (item != null) {
                  addItem(item);
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.add),
                  // SizedBox(width: 10),
                  Text('追加')
                ],
              ),
            ),
            Row(
              children: [
                Checkbox(
                    value: showDelete,
                    onChanged: (value) => showDeleteChange(value)),
                const Text('削除済を表示')
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _itemListTile(
      BuildContext context,
      int index,
      String name,
      Item item,
      bool showDelete,
      Function(int index, Item) editItem,
      Function(Item) toggleItem,
      Function(Item) removeItem) {
    if (!showDelete && item.isDeleted) {
      return SizedBox.shrink(key: UniqueKey());
    }

    return InkWell(
      key: UniqueKey(),
      onTap: () async {
        if (item.isDeleted) return;
        var result = await showItemDialog(context, name,
            name: item.name, memo: item.memo, paragraph: item.paragraph);
        if (result != null) editItem(index, result);
      },
      child: Container(
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black12, width: 1)),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.all(8),
              child: ReorderableDragStartListener(
                index: index,
                child: const Icon(Icons.drag_handle),
              ),
            ),
            InkWell(
              onTap: () async {
                toggleItem(item);
              },
              child: item.isDeleted
                  ? const Icon(Icons.delete)
                  : const Icon(Icons.delete_outline),
            ),
            SizedBox(width: 10),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: item.isDeleted
                      ? const TextStyle(
                          color: Colors.black38,
                          decoration: TextDecoration.lineThrough)
                      : null,
                ),
                if (item.memo != null && !item.isDeleted)
                  Text(
                    item.memo!,
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black45,
                        decoration:
                            item.isDeleted ? TextDecoration.lineThrough : null),
                  ),
              ],
            )),
            if (item.paragraph != null && !item.isDeleted)
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Text(
                  '(${item.paragraph})',
                  style: const TextStyle(fontSize: 14, color: Colors.black45),
                ),
              ),
            if (item.isDeleted) ...[
              InkWell(
                onTap: () async {
                  removeItem(item);
                },
                child: Icon(Icons.close),
              ),
              SizedBox(width: 10)
            ],
          ],
        ),
      ),
    );
  }

  Widget _deletedListTile(
      BuildContext context,
      int index,
      String name,
      Item item,
      Function(int index, Item) editItem,
      Function(Item) removeItem) {
    return InkWell(
      key: UniqueKey(),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black12, width: 1)),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.all(8),
              child: ReorderableDragStartListener(
                index: index,
                child: const Icon(Icons.drag_handle),
              ),
            ),
            InkWell(
              onTap: () async {
                var result =
                    await showAlertDialog(context, '確認', '削除してもよろしいですか？');
                if (result ?? false) removeItem(item);
              },
              child: const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                child: Icon(Icons.delete),
              ),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name),
                if (item.memo != null)
                  Text(
                    item.memo!,
                    style: const TextStyle(fontSize: 12, color: Colors.black45),
                  ),
              ],
            )),
            if (item.paragraph != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Text(
                  '(${item.paragraph})',
                  style: const TextStyle(fontSize: 14, color: Colors.black45),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
