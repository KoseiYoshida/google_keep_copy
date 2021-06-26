import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:goggle_keep_copy/models/unique_content.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final uniqueContentsRepositoryProvider =
    Provider.autoDispose<UniqueContentsRepository>(
        (ref) => UniqueContentsRepositorySharedPreference());

abstract class UniqueContentsRepository {
  Future<List<UniqueContent>> loadUniqueContents();
  Future<void> saveUniqueContents(List<UniqueContent> uniqueContents);
}

class UniqueContentsRepositorySharedPreference
    implements UniqueContentsRepository {
  static const String _key = 'unique_contents';

  @override
  Future<List<UniqueContent>> loadUniqueContents() async {
    final prefs = await SharedPreferences.getInstance();

    final loaded = prefs.getStringList(_key);

    if (loaded != null) {
      try {
        return loaded.map((e) {
          final json = jsonDecode(e) as Map<String, dynamic>;
          return UniqueContent.fromJson(json);
        }).toList();
      } on Exception catch (e) {
        debugPrint('Failed to parse saved data to contents. '
            'Ex:$e, Loaded data:$loaded');

        return [];
      }
    } else {
      return [];
    }
  }

  @override
  Future<void> saveUniqueContents(List<UniqueContent> uniqueContents) async {
    final prefs = await SharedPreferences.getInstance();

    final jsonList = uniqueContents.map((e) {
      return json.encode(e);
    }).toList();

    await prefs.setStringList(
      _key,
      jsonList,
    );
  }
}
