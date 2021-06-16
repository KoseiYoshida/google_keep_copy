import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_content_image_state.freezed.dart';

@freezed
abstract class EditContentImageState with _$EditContentImageState {
  factory EditContentImageState({
    @Default(0) int currentImageIndex,
    @Default(<ImageProvider>[]) List<ImageProvider> images,
  }) = _EditContentImageState;

  EditContentImageState._();
}
