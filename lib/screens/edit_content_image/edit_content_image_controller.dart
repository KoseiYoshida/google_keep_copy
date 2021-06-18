import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:goggle_keep_copy/models/unique_content_id.dart';
import 'package:goggle_keep_copy/screens/edit_content/edit_content_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'edit_content_image_state.dart';

final editContentImageProvider = StateNotifierProvider.autoDispose
    .family<EditContentImageController, EditContentImageState, UniqueContentId>(
        (ref, id) => EditContentImageController(
              ref.read,
              id: id,
            ));

class EditContentImageController extends StateNotifier<EditContentImageState> {
  EditContentImageController(
    this._read, {
    required this.id,
  }) : super(EditContentImageState()) {
    _editContentControllerRemoveListener =
        _read(editContentProvider(id).notifier).addListener((contentsState) {
      final images = contentsState.content.images;
      state = state.copyWith(images: images);
    });

    final images = _read(editContentProvider(id)).content.images;
    state = state.copyWith(
      images: images,
    );
  }

  final Reader _read;
  final UniqueContentId id;

  late final VoidCallback _editContentControllerRemoveListener;

  void toNext() {
    final nextIndex = state.currentImageIndex;
    if (nextIndex == state.images.length - 1) {
      return;
    }
    state = state.copyWith(currentImageIndex: nextIndex + 1);
  }

  void toPrev() {
    final prevIndex = state.currentImageIndex;
    if (prevIndex == 0) {
      return;
    }

    state = state.copyWith(currentImageIndex: prevIndex - 1);
  }

  void open(int index) {
    state = state.copyWith(currentImageIndex: index);
  }

  // 特定のイメージを削除する。
  void delete(ImageProvider image) {
    _read(editContentProvider(id).notifier).deleteImage(image);
  }

  void deleteCurrent() {
    delete(state.images[state.currentImageIndex]);
  }

  int get currentIndex => state.currentImageIndex;

  int get length => state.images.length;

  @override
  void dispose() {
    _editContentControllerRemoveListener();

    super.dispose();
  }
}
