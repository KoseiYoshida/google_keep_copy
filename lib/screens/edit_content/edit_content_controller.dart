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
    _uniqueContentsController = _read(uniqueContentsProvider.notifier);

    // 大元のコントローラーの状態を同期させる。
    _uniqueContentsControllerRemoveListener =
        _uniqueContentsController.addListener((contentsState) {
      final content = contentsState.uniqueContent(id).content;
      state = state.copyWith(content: content);
    });

    final uContent = _read(uniqueContentsProvider).uniqueContent(id);
    state = EditContentState(content: uContent.content);
  }

  final Reader _read;
  final UniqueContentId id;
  late final UniqueContentsController _uniqueContentsController;

  late final VoidCallback _uniqueContentsControllerRemoveListener;

  void update(Content newContent) {
    // 自信のStateは直接更新しない。
    // UniqueContentsControllerに追従するようにだけイベント登録しているため。
    _uniqueContentsController.updateContent(id, newContent);
  }

  void deleteImage(String path) {
    final newImagePaths = List<String>.from(state.content.imagePaths)
      ..removeWhere((element) => element == path);
    final currentContent = state.content;
    final newContent = currentContent.copyWith(imagePaths: newImagePaths);

    update(newContent);
  }

  @override
  void dispose() {
    _uniqueContentsControllerRemoveListener();

    super.dispose();
  }
}
