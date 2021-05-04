import 'package:quiver/strings.dart' as quiver;

extension Quiver on String {
  bool get isBlank => quiver.isBlank(this);
  bool get isNotBlank => quiver.isNotBlank(this);
}
