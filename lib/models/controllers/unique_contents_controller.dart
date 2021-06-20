import 'package:goggle_keep_copy/models/content.dart';
import 'package:goggle_keep_copy/models/unique_content.dart';
import 'package:goggle_keep_copy/models/unique_content_id.dart';
import 'package:goggle_keep_copy/repository/unique_contents_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import 'unique_contents_state.dart';

final uniqueContentsProvider =
    StateNotifierProvider<UniqueContentsController, UniqueContentsState>(
  (ref) => UniqueContentsController(ref.read),
);

class UniqueContentsController extends StateNotifier<UniqueContentsState> {
  UniqueContentsController(this._read) : super(UniqueContentsState()) {
    _read(uniqueContentsRepositoryProvider)
        .loadUniqueContents()
        .then((value) => state = state.copyWith(contents: value));
  }

  final Reader _read;

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

    _read(uniqueContentsRepositoryProvider).saveUniqueContents(state.contents);

    return newUniqueContent.id;
  }

  void updateContent(UniqueContentId id, Content content) {
    final clone = state.contents.map<UniqueContent>((e) {
      if (e.id == id) {
        return e.copyWith(content: content);
      } else {
        return e;
      }
    }).toList();

    state = state.copyWith(contents: clone);

    _read(uniqueContentsRepositoryProvider).saveUniqueContents(state.contents);
  }

  void delete(UniqueContentId uniqueContentId) {
    state = state.copyWith(
      contents: state.contents
        ..removeWhere((element) => element.id == uniqueContentId),
    );

    _read(uniqueContentsRepositoryProvider).saveUniqueContents(state.contents);
  }
}
