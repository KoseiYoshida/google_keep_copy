// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'edit_content_image_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EditContentImageStateTearOff {
  const _$EditContentImageStateTearOff();

  _EditContentImageState call(
      {int currentImageIndex = 0,
      List<ImageProvider<Object>> images = const <ImageProvider>[]}) {
    return _EditContentImageState(
      currentImageIndex: currentImageIndex,
      images: images,
    );
  }
}

/// @nodoc
const $EditContentImageState = _$EditContentImageStateTearOff();

/// @nodoc
mixin _$EditContentImageState {
  int get currentImageIndex => throw _privateConstructorUsedError;
  List<ImageProvider<Object>> get images => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditContentImageStateCopyWith<EditContentImageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditContentImageStateCopyWith<$Res> {
  factory $EditContentImageStateCopyWith(EditContentImageState value,
          $Res Function(EditContentImageState) then) =
      _$EditContentImageStateCopyWithImpl<$Res>;
  $Res call({int currentImageIndex, List<ImageProvider<Object>> images});
}

/// @nodoc
class _$EditContentImageStateCopyWithImpl<$Res>
    implements $EditContentImageStateCopyWith<$Res> {
  _$EditContentImageStateCopyWithImpl(this._value, this._then);

  final EditContentImageState _value;
  // ignore: unused_field
  final $Res Function(EditContentImageState) _then;

  @override
  $Res call({
    Object? currentImageIndex = freezed,
    Object? images = freezed,
  }) {
    return _then(_value.copyWith(
      currentImageIndex: currentImageIndex == freezed
          ? _value.currentImageIndex
          : currentImageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageProvider<Object>>,
    ));
  }
}

/// @nodoc
abstract class _$EditContentImageStateCopyWith<$Res>
    implements $EditContentImageStateCopyWith<$Res> {
  factory _$EditContentImageStateCopyWith(_EditContentImageState value,
          $Res Function(_EditContentImageState) then) =
      __$EditContentImageStateCopyWithImpl<$Res>;
  @override
  $Res call({int currentImageIndex, List<ImageProvider<Object>> images});
}

/// @nodoc
class __$EditContentImageStateCopyWithImpl<$Res>
    extends _$EditContentImageStateCopyWithImpl<$Res>
    implements _$EditContentImageStateCopyWith<$Res> {
  __$EditContentImageStateCopyWithImpl(_EditContentImageState _value,
      $Res Function(_EditContentImageState) _then)
      : super(_value, (v) => _then(v as _EditContentImageState));

  @override
  _EditContentImageState get _value => super._value as _EditContentImageState;

  @override
  $Res call({
    Object? currentImageIndex = freezed,
    Object? images = freezed,
  }) {
    return _then(_EditContentImageState(
      currentImageIndex: currentImageIndex == freezed
          ? _value.currentImageIndex
          : currentImageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageProvider<Object>>,
    ));
  }
}

/// @nodoc

class _$_EditContentImageState extends _EditContentImageState
    with DiagnosticableTreeMixin {
  _$_EditContentImageState(
      {this.currentImageIndex = 0, this.images = const <ImageProvider>[]})
      : super._();

  @JsonKey(defaultValue: 0)
  @override
  final int currentImageIndex;
  @JsonKey(defaultValue: const <ImageProvider>[])
  @override
  final List<ImageProvider<Object>> images;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EditContentImageState(currentImageIndex: $currentImageIndex, images: $images)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EditContentImageState'))
      ..add(DiagnosticsProperty('currentImageIndex', currentImageIndex))
      ..add(DiagnosticsProperty('images', images));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EditContentImageState &&
            (identical(other.currentImageIndex, currentImageIndex) ||
                const DeepCollectionEquality()
                    .equals(other.currentImageIndex, currentImageIndex)) &&
            (identical(other.images, images) ||
                const DeepCollectionEquality().equals(other.images, images)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(currentImageIndex) ^
      const DeepCollectionEquality().hash(images);

  @JsonKey(ignore: true)
  @override
  _$EditContentImageStateCopyWith<_EditContentImageState> get copyWith =>
      __$EditContentImageStateCopyWithImpl<_EditContentImageState>(
          this, _$identity);
}

abstract class _EditContentImageState extends EditContentImageState {
  factory _EditContentImageState(
      {int currentImageIndex,
      List<ImageProvider<Object>> images}) = _$_EditContentImageState;
  _EditContentImageState._() : super._();

  @override
  int get currentImageIndex => throw _privateConstructorUsedError;
  @override
  List<ImageProvider<Object>> get images => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EditContentImageStateCopyWith<_EditContentImageState> get copyWith =>
      throw _privateConstructorUsedError;
}
