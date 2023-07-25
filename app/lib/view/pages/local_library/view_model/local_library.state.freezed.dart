// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_library.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LocalLibraryState {
  bool get isLoading => throw _privateConstructorUsedError;
  String get localLibPath => throw _privateConstructorUsedError;
  List<LocalBook> get files => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocalLibraryStateCopyWith<LocalLibraryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalLibraryStateCopyWith<$Res> {
  factory $LocalLibraryStateCopyWith(
          LocalLibraryState value, $Res Function(LocalLibraryState) then) =
      _$LocalLibraryStateCopyWithImpl<$Res, LocalLibraryState>;
  @useResult
  $Res call({bool isLoading, String localLibPath, List<LocalBook> files});
}

/// @nodoc
class _$LocalLibraryStateCopyWithImpl<$Res, $Val extends LocalLibraryState>
    implements $LocalLibraryStateCopyWith<$Res> {
  _$LocalLibraryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? localLibPath = null,
    Object? files = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      localLibPath: null == localLibPath
          ? _value.localLibPath
          : localLibPath // ignore: cast_nullable_to_non_nullable
              as String,
      files: null == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<LocalBook>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LocalLibraryStateCopyWith<$Res>
    implements $LocalLibraryStateCopyWith<$Res> {
  factory _$$_LocalLibraryStateCopyWith(_$_LocalLibraryState value,
          $Res Function(_$_LocalLibraryState) then) =
      __$$_LocalLibraryStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String localLibPath, List<LocalBook> files});
}

/// @nodoc
class __$$_LocalLibraryStateCopyWithImpl<$Res>
    extends _$LocalLibraryStateCopyWithImpl<$Res, _$_LocalLibraryState>
    implements _$$_LocalLibraryStateCopyWith<$Res> {
  __$$_LocalLibraryStateCopyWithImpl(
      _$_LocalLibraryState _value, $Res Function(_$_LocalLibraryState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? localLibPath = null,
    Object? files = null,
  }) {
    return _then(_$_LocalLibraryState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      localLibPath: null == localLibPath
          ? _value.localLibPath
          : localLibPath // ignore: cast_nullable_to_non_nullable
              as String,
      files: null == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<LocalBook>,
    ));
  }
}

/// @nodoc

class _$_LocalLibraryState implements _LocalLibraryState {
  const _$_LocalLibraryState(
      {required this.isLoading,
      required this.localLibPath,
      required final List<LocalBook> files})
      : _files = files;

  @override
  final bool isLoading;
  @override
  final String localLibPath;
  final List<LocalBook> _files;
  @override
  List<LocalBook> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  @override
  String toString() {
    return 'LocalLibraryState(isLoading: $isLoading, localLibPath: $localLibPath, files: $files)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocalLibraryState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.localLibPath, localLibPath) ||
                other.localLibPath == localLibPath) &&
            const DeepCollectionEquality().equals(other._files, _files));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, localLibPath,
      const DeepCollectionEquality().hash(_files));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocalLibraryStateCopyWith<_$_LocalLibraryState> get copyWith =>
      __$$_LocalLibraryStateCopyWithImpl<_$_LocalLibraryState>(
          this, _$identity);
}

abstract class _LocalLibraryState implements LocalLibraryState {
  const factory _LocalLibraryState(
      {required final bool isLoading,
      required final String localLibPath,
      required final List<LocalBook> files}) = _$_LocalLibraryState;

  @override
  bool get isLoading;
  @override
  String get localLibPath;
  @override
  List<LocalBook> get files;
  @override
  @JsonKey(ignore: true)
  _$$_LocalLibraryStateCopyWith<_$_LocalLibraryState> get copyWith =>
      throw _privateConstructorUsedError;
}
