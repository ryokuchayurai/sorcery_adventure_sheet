import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sorcery_adventure_sheet/domain/memo.dart';

final memoRepositoryProvider = Provider((ref) => MemoRepository());

class MemoRepository {
  Future<Memo> save(Memo memo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('memo', jsonEncode(memo.toJson()));
    return memo;
  }

  Future<Memo?> load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? json = prefs.getString('memo');
    if (json == null) {
      return null;
    }
    return Memo.fromJson(jsonDecode(json));
  }
}
