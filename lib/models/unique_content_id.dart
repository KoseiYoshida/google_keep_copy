import 'package:uuid/uuid.dart';

class UniqueContentId {
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
}
