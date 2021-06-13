import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:goggle_keep_copy/models/content.dart';

part 'edit_content_state.freezed.dart';

@freezed
abstract class EditContentState with _$EditContentState {
  factory EditContentState({
    @Default(Content()) Content content,
  }) = _EditContentState;

  EditContentState._();
}
