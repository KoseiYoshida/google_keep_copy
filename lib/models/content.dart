import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'content.freezed.dart';

@freezed
abstract class Content with _$Content {
  const factory Content({
    @Default('') String title,
    @Default('') String text,
    @Default(<ImageProvider>[]) List<ImageProvider> images,
  }) = _Content;

  const Content._();
}
