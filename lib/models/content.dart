import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'content.freezed.dart';
part 'content.g.dart';

@freezed
abstract class Content with _$Content {
  const factory Content({
    @Default('') String title,
    @Default('') String text,
    @Default(<String>[]) List<String> imagePaths,
  }) = _Content;

  const Content._();

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);
}
