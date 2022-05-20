import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorcery_adventure_sheet/domain/memo.dart';
import 'package:sorcery_adventure_sheet/repository/memo_repository.dart';

final memoModelProvider = ChangeNotifierProvider(
  (ref) {
    final memoRepository = ref.watch(memoRepositoryProvider);
    return MemoModel(memoRepository);
  },
);

class MemoModel extends ChangeNotifier {
  MemoModel(this._memoRepository) {
    load();
  }

  final MemoRepository _memoRepository;

  bool loaded = false;

  Memo? memo;

  Future<void> load() async {
    memo = await _memoRepository.load();
    loaded = true;
    notifyListeners();
  }

  Future<void> save(int? bookmark, String? text) async {
    memo = Memo(bookmark: bookmark, text: text);
    await _memoRepository.save(memo!);
    notifyListeners();
  }
}
