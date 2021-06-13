import 'package:flutter/material.dart';
import 'package:goggle_keep_copy/models/content.dart';
import 'package:goggle_keep_copy/models/controllers/unique_contents_controller.dart';
import 'package:goggle_keep_copy/models/unique_content_id.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'edit_content_state.dart';

final editContentProvider = StateNotifierProvider.autoDispose
    .family<EditContentController, EditContentState, UniqueContentId>(
        (ref, id) => EditContentController(
              ref.read,
              id: id,
            ));

class EditContentController extends StateNotifier<EditContentState> {
  EditContentController(
    this._read, {
    required this.id,
  }) : super(EditContentState()) {
    _uniqueContentsControllerRemoveListener =
        _read(uniqueContentsProvider.notifier).addListener((contentsState) {
      final content = contentsState.uniqueContent(id).content;
      state = state.copyWith(content: content);
    });

    final uContent = _read(uniqueContentsProvider).uniqueContent(id);
    state = EditContentState(content: uContent.content);
  }

  final Reader _read;
  final UniqueContentId id;

  late final VoidCallback _uniqueContentsControllerRemoveListener;

  void update(Content newContent) {
    _read(uniqueContentsProvider.notifier).updateContent(id, newContent);
    // 自信のStateは直接更新しない。
    // UniqueContentsControllerに追従するようにだけイベント登録しているため。
  }

  @override
  void dispose() {
    _uniqueContentsControllerRemoveListener();

    super.dispose();
  }
}
