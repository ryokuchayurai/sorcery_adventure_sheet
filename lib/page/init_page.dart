import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:sorcery_adventure_sheet/model/adventure_sheet_model.dart';

class InitPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(adventureSheetModelProvider).load().then((value) {
      if (ref.read(adventureSheetModelProvider).created) {
        Routemaster.of(context).replace('/main');
      } else {
        Routemaster.of(context).replace('/create');
      }
    }).catchError((error) {
      Routemaster.of(context).replace('/create');
    });

    return Scaffold(
      body: Center(child: Text('Loading')),
    );
  }
}
