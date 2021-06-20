import 'package:flutter/cupertino.dart';
import 'package:goggle_keep_copy/models/content.dart';
import 'package:goggle_keep_copy/models/unique_content.dart';
import 'package:goggle_keep_copy/models/unique_content_id.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiver/iterables.dart';

final uniqueContentsRepositoryProvider =
    Provider.autoDispose<UniqueContentsRepository>(
        (ref) => UniqueContentsRepositoryTest());

abstract class UniqueContentsRepository {
  Future<List<UniqueContent>> loadUniqueContents();
  Future<void> saveUniqueContents(List<UniqueContent> uniqueContents);
}

class UniqueContentsRepositoryTest implements UniqueContentsRepository {
  @override
  Future<List<UniqueContent>> loadUniqueContents() async {
    await Future<void>.delayed(const Duration(seconds: 3));

    debugPrint('load');

    return [
      for (var index in range(3))
        UniqueContent(
          id: UniqueContentId.generate(),
          content: Content(
            title: 'title$index',
            text: 'text$index',
            images: [
              const AssetImage(
                'assets/monkey.jpg',
              )
            ],
          ),
        )
    ];
  }

  @override
  Future<void> saveUniqueContents(List<UniqueContent> uniqueContents) async {
    await Future<void>.delayed(const Duration(seconds: 3));
    uniqueContents.forEach(print);
  }
}
