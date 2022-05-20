import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sorcery_adventure_sheet/domain/adventure_sheet.dart';

final adventureSheetRepositoryProvider =
    Provider((ref) => AdventureSheetRepository());

class AdventureSheetRepository {
  Future<AdventureSheet> save(AdventureSheet adventureSheet) async {
    await _save(adventureSheet, 'main');
    return adventureSheet;
  }

  Future<AdventureSheet?> load() => _load('main');

  Future<void> remove() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('main');
  }

  Future<Set<String>> list() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs
        .getKeys()
        .where((element) => element != 'main' && element != 'memo')
        .map((e) => utf8.decode(base64.decode(e)))
        .toSet();
  }

  Future<AdventureSheet> saveAs(
      AdventureSheet adventureSheet, String name) async {
    await _save(adventureSheet, base64.encode(utf8.encode(name)));
    return adventureSheet;
  }

  Future<void> removeAs(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(base64.encode(utf8.encode(name)));
  }

  Future<void> rename(String oldName, String newName) async {
    final oldKey = base64.encode(utf8.encode(oldName));
    final newKey = base64.encode(utf8.encode(newName));

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(oldKey);
    if (data != null) {
      prefs.setString(newKey, data);
      prefs.remove(oldKey);
    }
  }

  Future<AdventureSheet?> loadAs(String name) =>
      _load(base64.encode(utf8.encode(name)));

  Future<void> _save(AdventureSheet adventureSheet, String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, jsonEncode(adventureSheet.toJson()));
  }

  Future<AdventureSheet?> _load(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? json = prefs.getString(key);
    if (json == null) {
      return null;
    }
    return AdventureSheet.fromJson(jsonDecode(json));
  }
}
