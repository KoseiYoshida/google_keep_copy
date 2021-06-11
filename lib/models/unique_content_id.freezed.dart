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

  _UniqueContentId generate() {
    return _UniqueContentId();
  }
}

/// @nodoc
const $UniqueContentId = _$UniqueContentIdTearOff();

/// @nodoc
mixin _$UniqueContentId {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() generate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? generate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UniqueContentId value) generate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UniqueContentId value)? generate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UniqueContentIdCopyWith<$Res> {
  factory $UniqueContentIdCopyWith(
          UniqueContentId value, $Res Function(UniqueContentId) then) =
      _$UniqueContentIdCopyWithImpl<$Res>;
}

/// @nodoc
class _$UniqueContentIdCopyWithImpl<$Res>
    implements $UniqueContentIdCopyWith<$Res> {
  _$UniqueContentIdCopyWithImpl(this._value, this._then);

  final UniqueContentId _value;
  // ignore: unused_field
  final $Res Function(UniqueContentId) _then;
}

/// @nodoc
abstract class _$UniqueContentIdCopyWith<$Res> {
  factory _$UniqueContentIdCopyWith(
          _UniqueContentId value, $Res Function(_UniqueContentId) then) =
      __$UniqueContentIdCopyWithImpl<$Res>;
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
}

/// @nodoc

class _$_UniqueContentId extends _UniqueContentId with DiagnosticableTreeMixin {
  _$_UniqueContentId() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UniqueContentId.generate()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'UniqueContentId.generate'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _UniqueContentId);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() generate,
  }) {
    return generate();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? generate,
    required TResult orElse(),
  }) {
    if (generate != null) {
      return generate();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UniqueContentId value) generate,
  }) {
    return generate(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UniqueContentId value)? generate,
    required TResult orElse(),
  }) {
    if (generate != null) {
      return generate(this);
    }
    return orElse();
  }
}

abstract class _UniqueContentId extends UniqueContentId {
  factory _UniqueContentId() = _$_UniqueContentId;
  _UniqueContentId._() : super._();
}
