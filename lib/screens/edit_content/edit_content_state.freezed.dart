// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'edit_content_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EditContentStateTearOff {
  const _$EditContentStateTearOff();

  _EditContentState call({Content content = const Content()}) {
    return _EditContentState(
      content: content,
    );
  }
}

/// @nodoc
const $EditContentState = _$EditContentStateTearOff();

/// @nodoc
mixin _$EditContentState {
  Content get content => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditContentStateCopyWith<EditContentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditContentStateCopyWith<$Res> {
  factory $EditContentStateCopyWith(
          EditContentState value, $Res Function(EditContentState) then) =
      _$EditContentStateCopyWithImpl<$Res>;
  $Res call({Content content});

  $ContentCopyWith<$Res> get content;
}

/// @nodoc
class _$EditContentStateCopyWithImpl<$Res>
    implements $EditContentStateCopyWith<$Res> {
  _$EditContentStateCopyWithImpl(this._value, this._then);

  final EditContentState _value;
  // ignore: unused_field
  final $Res Function(EditContentState) _then;

  @override
  $Res call({
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
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
abstract class _$EditContentStateCopyWith<$Res>
    implements $EditContentStateCopyWith<$Res> {
  factory _$EditContentStateCopyWith(
          _EditContentState value, $Res Function(_EditContentState) then) =
      __$EditContentStateCopyWithImpl<$Res>;
  @override
  $Res call({Content content});

  @override
  $ContentCopyWith<$Res> get content;
}

/// @nodoc
class __$EditContentStateCopyWithImpl<$Res>
    extends _$EditContentStateCopyWithImpl<$Res>
    implements _$EditContentStateCopyWith<$Res> {
  __$EditContentStateCopyWithImpl(
      _EditContentState _value, $Res Function(_EditContentState) _then)
      : super(_value, (v) => _then(v as _EditContentState));

  @override
  _EditContentState get _value => super._value as _EditContentState;

  @override
  $Res call({
    Object? content = freezed,
  }) {
    return _then(_EditContentState(
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as Content,
    ));
  }
}

/// @nodoc

class _$_EditContentState extends _EditContentState
    with DiagnosticableTreeMixin {
  _$_EditContentState({this.content = const Content()}) : super._();

  @JsonKey(defaultValue: const Content())
  @override
  final Content content;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EditContentState(content: $content)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EditContentState'))
      ..add(DiagnosticsProperty('content', content));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EditContentState &&
            (identical(other.content, content) ||
                const DeepCollectionEquality().equals(other.content, content)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(content);

  @JsonKey(ignore: true)
  @override
  _$EditContentStateCopyWith<_EditContentState> get copyWith =>
      __$EditContentStateCopyWithImpl<_EditContentState>(this, _$identity);
}

abstract class _EditContentState extends EditContentState {
  factory _EditContentState({Content content}) = _$_EditContentState;
  _EditContentState._() : super._();

  @override
  Content get content => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EditContentStateCopyWith<_EditContentState> get copyWith =>
      throw _privateConstructorUsedError;
}
