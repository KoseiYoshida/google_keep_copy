import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'unique_content_id.freezed.dart';

@freezed
abstract class UniqueContentId with _$UniqueContentId {
  factory UniqueContentId({
    required String id,
  }) = _UniqueContentId;

  UniqueContentId._();
}
