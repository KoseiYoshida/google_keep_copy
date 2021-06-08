import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'content.freezed.dart';

@freezed
abstract class Content with _$Content {
  factory Content({
    required String title,
    required String text,
    @Default(<ImageProvider>[]) List<ImageProvider> images,
  }) = _Content;

  Content._();
}
