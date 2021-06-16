import 'package:goggle_keep_copy/models/content.dart';
import 'package:goggle_keep_copy/models/unique_content.dart';
import 'package:goggle_keep_copy/models/unique_content_id.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import 'unique_contents_state.dart';

final uniqueContentsProvider =
    StateNotifierProvider<UniqueContentsController, UniqueContentsState>(
  (ref) => UniqueContentsController(),
);

class UniqueContentsController extends StateNotifier<UniqueContentsState> {
  UniqueContentsController() : super(UniqueContentsState());

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

  void updateContent(UniqueContentId id, Content content) {
    final clone = state.contents.map<UniqueContent>((e) {
      if (e.id == id) {
        return e.copyWith(content: content);
      } else {
        return e;
      }
    }).toList();

    state = state.copyWith(contents: clone);
  }

  void delete(UniqueContentId uniqueContentId) {
    state = state.copyWith(
      contents: state.contents
        ..removeWhere((element) => element.id == uniqueContentId),
    );
  }
}
