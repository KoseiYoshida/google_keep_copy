// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'unique_contents_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UniqueContentsStateTearOff {
  const _$UniqueContentsStateTearOff();

  _UniqueContentsState call(
      {List<UniqueContent> contents = const <UniqueContent>[]}) {
    return _UniqueContentsState(
      contents: contents,
    );
  }
}

/// @nodoc
const $UniqueContentsState = _$UniqueContentsStateTearOff();

/// @nodoc
mixin _$UniqueContentsState {
  List<UniqueContent> get contents => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UniqueContentsStateCopyWith<UniqueContentsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UniqueContentsStateCopyWith<$Res> {
  factory $UniqueContentsStateCopyWith(
          UniqueContentsState value, $Res Function(UniqueContentsState) then) =
      _$UniqueContentsStateCopyWithImpl<$Res>;
  $Res call({List<UniqueContent> contents});
}

/// @nodoc
class _$UniqueContentsStateCopyWithImpl<$Res>
    implements $UniqueContentsStateCopyWith<$Res> {
  _$UniqueContentsStateCopyWithImpl(this._value, this._then);

  final UniqueContentsState _value;
  // ignore: unused_field
  final $Res Function(UniqueContentsState) _then;

  @override
  $Res call({
    Object? contents = freezed,
  }) {
    return _then(_value.copyWith(
      contents: contents == freezed
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<UniqueContent>,
    ));
  }
}

/// @nodoc
abstract class _$UniqueContentsStateCopyWith<$Res>
    implements $UniqueContentsStateCopyWith<$Res> {
  factory _$UniqueContentsStateCopyWith(_UniqueContentsState value,
          $Res Function(_UniqueContentsState) then) =
      __$UniqueContentsStateCopyWithImpl<$Res>;
  @override
  $Res call({List<UniqueContent> contents});
}

/// @nodoc
class __$UniqueContentsStateCopyWithImpl<$Res>
    extends _$UniqueContentsStateCopyWithImpl<$Res>
    implements _$UniqueContentsStateCopyWith<$Res> {
  __$UniqueContentsStateCopyWithImpl(
      _UniqueContentsState _value, $Res Function(_UniqueContentsState) _then)
      : super(_value, (v) => _then(v as _UniqueContentsState));

  @override
  _UniqueContentsState get _value => super._value as _UniqueContentsState;

  @override
  $Res call({
    Object? contents = freezed,
  }) {
    return _then(_UniqueContentsState(
      contents: contents == freezed
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<UniqueContent>,
    ));
  }
}

/// @nodoc

class _$_UniqueContentsState extends _UniqueContentsState
    with DiagnosticableTreeMixin {
  _$_UniqueContentsState({this.contents = const <UniqueContent>[]}) : super._();

  @JsonKey(defaultValue: const <UniqueContent>[])
  @override
  final List<UniqueContent> contents;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UniqueContentsState(contents: $contents)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UniqueContentsState'))
      ..add(DiagnosticsProperty('contents', contents));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UniqueContentsState &&
            (identical(other.contents, contents) ||
                const DeepCollectionEquality()
                    .equals(other.contents, contents)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(contents);

  @JsonKey(ignore: true)
  @override
  _$UniqueContentsStateCopyWith<_UniqueContentsState> get copyWith =>
      __$UniqueContentsStateCopyWithImpl<_UniqueContentsState>(
          this, _$identity);
}

abstract class _UniqueContentsState extends UniqueContentsState {
  factory _UniqueContentsState({List<UniqueContent> contents}) =
      _$_UniqueContentsState;
  _UniqueContentsState._() : super._();

  @override
  List<UniqueContent> get contents => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UniqueContentsStateCopyWith<_UniqueContentsState> get copyWith =>
      throw _privateConstructorUsedError;
}
