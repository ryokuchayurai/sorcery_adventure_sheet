import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorcery_adventure_sheet/model/memo_model.dart';

class MemoDialog extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(memoModelProvider);
    debugPrint('${model.memo?.bookmark?.toString()}');

    if (!model.loaded) {
      return Material(
          color: Colors.black.withOpacity(0.1),
          child: const Center(child: Text('Loading...')));
    }

    return SimpleDialog(
      alignment: Alignment.center,
      contentPadding: EdgeInsets.all(10),
      children: [
        TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'しおり',
          ),
          initialValue: model.memo?.bookmark?.toString(),
          onChanged: (value) {
            model.save(
                value.isNotEmpty ? int.parse(value) : null, model.memo?.text);
          },
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          maxLines: 10,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'メモ',
          ),
          initialValue: model.memo?.text,
          onChanged: (value) {
            model.save(model.memo?.bookmark, value);
          },
        ),
        const SizedBox(height: 10),
        const Text('冒険記録紙とは別で保存されます (冒険記録紙を消したり別の冒険記録紙を読み込んでもこの内容は残ります)',
            style: TextStyle(fontSize: 12)),
        const SizedBox(height: 10),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: [
        //     TextButton(
        //       child: Text('Cancel'),
        //       onPressed: () {
        //         Routemaster.of(context).pop();
        //       },
        //     ),
        //     ElevatedButton(
        //       child: Text('OK'),
        //       onPressed: () async {
        //         await model.save(bookmark, text);
        //         Routemaster.of(context).pop();
        //       },
        //     )
        //   ],
        // )
      ],
    );
  }
}

Future<void> showMemoDialog(BuildContext context) async {
  await showDialog(
      context: context,
      builder: (context) {
        return MemoDialog();
      });
}
