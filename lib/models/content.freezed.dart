// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Content _$ContentFromJson(Map<String, dynamic> json) {
  return _Content.fromJson(json);
}

/// @nodoc
class _$ContentTearOff {
  const _$ContentTearOff();

  _Content call(
      {String title = '',
      String text = '',
      List<String> imagePaths = const <String>[]}) {
    return _Content(
      title: title,
      text: text,
      imagePaths: imagePaths,
    );
  }

  Content fromJson(Map<String, Object> json) {
    return Content.fromJson(json);
  }
}

/// @nodoc
const $Content = _$ContentTearOff();

/// @nodoc
mixin _$Content {
  String get title => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  List<String> get imagePaths => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentCopyWith<Content> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentCopyWith<$Res> {
  factory $ContentCopyWith(Content value, $Res Function(Content) then) =
      _$ContentCopyWithImpl<$Res>;
  $Res call({String title, String text, List<String> imagePaths});
}

/// @nodoc
class _$ContentCopyWithImpl<$Res> implements $ContentCopyWith<$Res> {
  _$ContentCopyWithImpl(this._value, this._then);

  final Content _value;
  // ignore: unused_field
  final $Res Function(Content) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? text = freezed,
    Object? imagePaths = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      imagePaths: imagePaths == freezed
          ? _value.imagePaths
          : imagePaths // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$ContentCopyWith<$Res> implements $ContentCopyWith<$Res> {
  factory _$ContentCopyWith(_Content value, $Res Function(_Content) then) =
      __$ContentCopyWithImpl<$Res>;
  @override
  $Res call({String title, String text, List<String> imagePaths});
}

/// @nodoc
class __$ContentCopyWithImpl<$Res> extends _$ContentCopyWithImpl<$Res>
    implements _$ContentCopyWith<$Res> {
  __$ContentCopyWithImpl(_Content _value, $Res Function(_Content) _then)
      : super(_value, (v) => _then(v as _Content));

  @override
  _Content get _value => super._value as _Content;

  @override
  $Res call({
    Object? title = freezed,
    Object? text = freezed,
    Object? imagePaths = freezed,
  }) {
    return _then(_Content(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      imagePaths: imagePaths == freezed
          ? _value.imagePaths
          : imagePaths // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Content extends _Content with DiagnosticableTreeMixin {
  const _$_Content(
      {this.title = '', this.text = '', this.imagePaths = const <String>[]})
      : super._();

  factory _$_Content.fromJson(Map<String, dynamic> json) =>
      _$_$_ContentFromJson(json);

  @JsonKey(defaultValue: '')
  @override
  final String title;
  @JsonKey(defaultValue: '')
  @override
  final String text;
  @JsonKey(defaultValue: const <String>[])
  @override
  final List<String> imagePaths;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Content(title: $title, text: $text, imagePaths: $imagePaths)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Content'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('text', text))
      ..add(DiagnosticsProperty('imagePaths', imagePaths));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Content &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)) &&
            (identical(other.imagePaths, imagePaths) ||
                const DeepCollectionEquality()
                    .equals(other.imagePaths, imagePaths)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(text) ^
      const DeepCollectionEquality().hash(imagePaths);

  @JsonKey(ignore: true)
  @override
  _$ContentCopyWith<_Content> get copyWith =>
      __$ContentCopyWithImpl<_Content>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ContentToJson(this);
  }
}

abstract class _Content extends Content {
  const factory _Content({String title, String text, List<String> imagePaths}) =
      _$_Content;
  const _Content._() : super._();

  factory _Content.fromJson(Map<String, dynamic> json) = _$_Content.fromJson;

  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get text => throw _privateConstructorUsedError;
  @override
  List<String> get imagePaths => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ContentCopyWith<_Content> get copyWith =>
      throw _privateConstructorUsedError;
}
