// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'unique_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UniqueContent _$UniqueContentFromJson(Map<String, dynamic> json) {
  return _UniqueContent.fromJson(json);
}

/// @nodoc
class _$UniqueContentTearOff {
  const _$UniqueContentTearOff();

  _UniqueContent call({required UniqueContentId id, required Content content}) {
    return _UniqueContent(
      id: id,
      content: content,
    );
  }

  UniqueContent fromJson(Map<String, Object> json) {
    return UniqueContent.fromJson(json);
  }
}

/// @nodoc
const $UniqueContent = _$UniqueContentTearOff();

/// @nodoc
mixin _$UniqueContent {
  UniqueContentId get id => throw _privateConstructorUsedError;
  Content get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UniqueContentCopyWith<UniqueContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UniqueContentCopyWith<$Res> {
  factory $UniqueContentCopyWith(
          UniqueContent value, $Res Function(UniqueContent) then) =
      _$UniqueContentCopyWithImpl<$Res>;
  $Res call({UniqueContentId id, Content content});

  $ContentCopyWith<$Res> get content;
}

/// @nodoc
class _$UniqueContentCopyWithImpl<$Res>
    implements $UniqueContentCopyWith<$Res> {
  _$UniqueContentCopyWithImpl(this._value, this._then);

  final UniqueContent _value;
  // ignore: unused_field
  final $Res Function(UniqueContent) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueContentId,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as Content,
    ));
  }

  @override
  $ContentCopyWith<$Res> get content {
    return $ContentCopyWith<$Res>(_value.content, (value) {
      return _then(_value.copyWith(content: value));
    });
  }
}

/// @nodoc
abstract class _$UniqueContentCopyWith<$Res>
    implements $UniqueContentCopyWith<$Res> {
  factory _$UniqueContentCopyWith(
          _UniqueContent value, $Res Function(_UniqueContent) then) =
      __$UniqueContentCopyWithImpl<$Res>;
  @override
  $Res call({UniqueContentId id, Content content});

  @override
  $ContentCopyWith<$Res> get content;
}

/// @nodoc
class __$UniqueContentCopyWithImpl<$Res>
    extends _$UniqueContentCopyWithImpl<$Res>
    implements _$UniqueContentCopyWith<$Res> {
  __$UniqueContentCopyWithImpl(
      _UniqueContent _value, $Res Function(_UniqueContent) _then)
      : super(_value, (v) => _then(v as _UniqueContent));

  @override
  _UniqueContent get _value => super._value as _UniqueContent;

  @override
  $Res call({
    Object? id = freezed,
    Object? content = freezed,
  }) {
    return _then(_UniqueContent(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueContentId,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as Content,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UniqueContent extends _UniqueContent with DiagnosticableTreeMixin {
  _$_UniqueContent({required this.id, required this.content}) : super._();

  factory _$_UniqueContent.fromJson(Map<String, dynamic> json) =>
      _$_$_UniqueContentFromJson(json);

  @override
  final UniqueContentId id;
  @override
  final Content content;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UniqueContent(id: $id, content: $content)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UniqueContent'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('content', content));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UniqueContent &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality().equals(other.content, content)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(content);

  @JsonKey(ignore: true)
  @override
  _$UniqueContentCopyWith<_UniqueContent> get copyWith =>
      __$UniqueContentCopyWithImpl<_UniqueContent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UniqueContentToJson(this);
  }
}

abstract class _UniqueContent extends UniqueContent {
  factory _UniqueContent(
      {required UniqueContentId id,
      required Content content}) = _$_UniqueContent;
  _UniqueContent._() : super._();

  factory _UniqueContent.fromJson(Map<String, dynamic> json) =
      _$_UniqueContent.fromJson;

  @override
  UniqueContentId get id => throw _privateConstructorUsedError;
  @override
  Content get content => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UniqueContentCopyWith<_UniqueContent> get copyWith =>
      throw _privateConstructorUsedError;
}
