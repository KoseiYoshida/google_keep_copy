import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'unique_content_id.freezed.dart';

@freezed
abstract class UniqueContentId with _$UniqueContentId {
  factory UniqueContentId.generate() = _UniqueContentId;

  UniqueContentId._();

  late final String _id = _generateUuid();

  static const _uuid = Uuid();

  static String _generateUuid() {
    return _uuid.v1().toLowerCase();
  }
}
