import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

class UniqueContentId {
  UniqueContentId._(this.id);

  UniqueContentId.generate() : id = _generateUuid();

  final String id;

  static const _uuid = Uuid();

  static String _generateUuid() {
    return _uuid.v1().toLowerCase();
  }

  @override
  String toString() {
    return 'UniqueContentId(id: $id)';
  }

  @override
  int get hashCode => runtimeType.hashCode ^ id.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UniqueContentId && other.id == id);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{'id': id};

  UniqueContentId.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String;
}
