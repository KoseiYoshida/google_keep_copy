import 'package:uuid/uuid.dart';

class UniqueContentId {
  UniqueContentId.generate() {
    _id = _generateUuid();
  }

  late final String _id;
  String get id => _id;

  static const _uuid = Uuid();

  static String _generateUuid() {
    return _uuid.v1().toLowerCase();
  }
}
