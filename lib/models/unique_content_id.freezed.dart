// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'unique_content_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UniqueContentIdTearOff {
  const _$UniqueContentIdTearOff();

  _UniqueContentId call({required String id}) {
    return _UniqueContentId(
      id: id,
    );
  }
}

/// @nodoc
const $UniqueContentId = _$UniqueContentIdTearOff();

/// @nodoc
mixin _$UniqueContentId {
  String get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UniqueContentIdCopyWith<UniqueContentId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UniqueContentIdCopyWith<$Res> {
  factory $UniqueContentIdCopyWith(
          UniqueContentId value, $Res Function(UniqueContentId) then) =
      _$UniqueContentIdCopyWithImpl<$Res>;
  $Res call({String id});
}

/// @nodoc
class _$UniqueContentIdCopyWithImpl<$Res>
    implements $UniqueContentIdCopyWith<$Res> {
  _$UniqueContentIdCopyWithImpl(this._value, this._then);

  final UniqueContentId _value;
  // ignore: unused_field
  final $Res Function(UniqueContentId) _then;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$UniqueContentIdCopyWith<$Res>
    implements $UniqueContentIdCopyWith<$Res> {
  factory _$UniqueContentIdCopyWith(
          _UniqueContentId value, $Res Function(_UniqueContentId) then) =
      __$UniqueContentIdCopyWithImpl<$Res>;
  @override
  $Res call({String id});
}

/// @nodoc
class __$UniqueContentIdCopyWithImpl<$Res>
    extends _$UniqueContentIdCopyWithImpl<$Res>
    implements _$UniqueContentIdCopyWith<$Res> {
  __$UniqueContentIdCopyWithImpl(
      _UniqueContentId _value, $Res Function(_UniqueContentId) _then)
      : super(_value, (v) => _then(v as _UniqueContentId));

  @override
  _UniqueContentId get _value => super._value as _UniqueContentId;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_UniqueContentId(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UniqueContentId extends _UniqueContentId with DiagnosticableTreeMixin {
  _$_UniqueContentId({required this.id}) : super._();

  @override
  final String id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UniqueContentId(id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UniqueContentId'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UniqueContentId &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(id);

  @JsonKey(ignore: true)
  @override
  _$UniqueContentIdCopyWith<_UniqueContentId> get copyWith =>
      __$UniqueContentIdCopyWithImpl<_UniqueContentId>(this, _$identity);
}

abstract class _UniqueContentId extends UniqueContentId {
  factory _UniqueContentId({required String id}) = _$_UniqueContentId;
  _UniqueContentId._() : super._();

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UniqueContentIdCopyWith<_UniqueContentId> get copyWith =>
      throw _privateConstructorUsedError;
}
