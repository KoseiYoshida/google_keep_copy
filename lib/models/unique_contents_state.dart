import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:goggle_keep_copy/models/unique_content.dart';
import 'package:goggle_keep_copy/models/unique_content_id.dart';

part 'unique_contents_state.freezed.dart';

@freezed
abstract class UniqueContentsState with _$UniqueContentsState {
  factory UniqueContentsState({
    @Default(<UniqueContent>[]) List<UniqueContent> contents,
  }) = _UniqueContentsState;

  UniqueContentsState._();

  UniqueContent uniqueContent(UniqueContentId id) {
    return contents.firstWhere((element) => element.id == id);
  }

  int getIndex(UniqueContentId id) {
    return contents.indexWhere((element) => element.id == id);
  }
}
