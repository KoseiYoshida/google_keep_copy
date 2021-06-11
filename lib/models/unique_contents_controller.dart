import 'package:flutter/material.dart';
import 'package:goggle_keep_copy/models/content.dart';
import 'package:goggle_keep_copy/models/unique_content.dart';
import 'package:goggle_keep_copy/models/unique_content_id.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiver/iterables.dart';
import 'package:state_notifier/state_notifier.dart';

import 'unique_contents_state.dart';

final uniqueContentsProvider =
    StateNotifierProvider<UniqueContentsController, UniqueContentsState>(
  (ref) => UniqueContentsController(),
);

class UniqueContentsController extends StateNotifier<UniqueContentsState>
    with LocatorMixin {
  UniqueContentsController() : super(UniqueContentsState());

  @override
  void initState() async {
    super.initState();

    // Load中状態を追加したら、使う。
    // await Future<void>.delayed(const Duration(seconds: 3));

    // TODO(Kosei): ProviderScopeのところで、overrideValueを使って初期データを挿入する。
    state = UniqueContentsState(
      contents: [
        for (final num in range(1, 5))
          UniqueContent(
            id: UniqueContentId.generate(),
            content: Content(
              title: 'Title$num',
              text: 'text$num',
              images: [
                const AssetImage('assets/monkey.jpg'),
                const AssetImage('assets/monkey.jpg'),
                const AssetImage('assets/monkey.jpg'),
              ],
            ),
          )
      ],
    );
  }

  UniqueContentId add(Content content) {
    final newUniqueContent = UniqueContent(
      id: UniqueContentId.generate(),
      content: content,
    );

    state = state.copyWith(
      contents: [
        ...state.contents,
        newUniqueContent,
      ],
    );

    return newUniqueContent.id;
  }

  void updateContent(UniqueContent content) {
    final currentState = state;
    final clone = currentState.contents.map<UniqueContent>((e) {
      if (e.id == content.id) {
        return e.copyWith(content: content.content);
      } else {
        return e;
      }
    }).toList();

    state = currentState.copyWith(contents: clone);
  }

  void delete(UniqueContentId uniqueContentId) {
    state = state.copyWith(
      contents: state.contents
        ..removeWhere((element) => element.id == uniqueContentId),
    );
  }

  void deleteImage(UniqueContentId uniqueContentId, ImageProvider image) {
    // TODO(Kosei): やってることが冗長すぎる。短い書き方or責務の分離ができるはず。
    // image削除専用のメソッドじゃなくて、updateContent使う方式にする！
    final uniqueContent = state.uniqueContent(uniqueContentId);
    final images = uniqueContent.content.images
      ..removeWhere((element) => element == image);

    final newContent = uniqueContent.content.copyWith(images: images);
    final newUniqueContent = uniqueContent.copyWith(content: newContent);

    final newContents = state.contents;
    final index = newContents.indexOf(uniqueContent);
    newContents.removeAt(index);
    newContents.insert(index, newUniqueContent);
    state = state.copyWith(contents: newContents);
  }
}
