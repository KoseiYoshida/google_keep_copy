import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:goggle_keep_copy/models/content.dart';

import 'unique_content_id.dart';

part 'unique_content.freezed.dart';

@freezed
abstract class UniqueContent with _$UniqueContent {
  factory UniqueContent({
    required UniqueContentId id,
    required Content content,
  }) = _UniqueContent;

  UniqueContent._();
}
