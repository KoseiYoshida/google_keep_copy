import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:goggle_keep_copy/models/unique_content_id.dart';
import 'package:goggle_keep_copy/models/unique_contents_controller.dart';
import 'package:goggle_keep_copy/screens/edit_content_image_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
    // TODO(Kosei): LocatorMixinを使った方がスッキリするのでは？
    _uniqueContentsControllerRemoveListener =
        _read(uniqueContentsProvider.notifier).addListener((contentsState) {
      final images = contentsState.uniqueContent(id).content.images;
      state.copyWith(images: images);
    });

    final images =
        _read(uniqueContentsProvider).uniqueContent(id).content.images;
    state = state.copyWith(
      images: images,
    );
  }

  final Reader _read;
  final UniqueContentId id;

  late final VoidCallback _uniqueContentsControllerRemoveListener;

  void toNext() {
    final nextIndex = state.currentImageIndex;
    if (nextIndex == state.images.length - 1) {
      return;
    }

    state = state.copyWith(currentImageIndex: nextIndex);
  }

  void toPrev() {
    final prevIndex = state.currentImageIndex;
    if (prevIndex == 0) {
      return;
    }

    state = state.copyWith(currentImageIndex: prevIndex);
  }

  void open(int index) {
    state = state.copyWith(currentImageIndex: index);
  }

  // 特定のイメージを削除する。
  void delete(ImageProvider image) {
    _read(uniqueContentsProvider.notifier).deleteImage(id, image);
  }

  void deleteCurrent() {
    delete(state.images[state.currentImageIndex]);
  }

  int get currentIndex => state.currentImageIndex;

  int get length => state.images.length;

  @override
  void dispose() {
    _uniqueContentsControllerRemoveListener();

    super.dispose();
  }
}
