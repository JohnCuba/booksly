// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'download_manager.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DownloadManagerState {
  List<dynamic> get downloads => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DownloadManagerStateCopyWith<DownloadManagerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadManagerStateCopyWith<$Res> {
  factory $DownloadManagerStateCopyWith(DownloadManagerState value,
          $Res Function(DownloadManagerState) then) =
      _$DownloadManagerStateCopyWithImpl<$Res, DownloadManagerState>;
  @useResult
  $Res call({List<dynamic> downloads});
}

/// @nodoc
class _$DownloadManagerStateCopyWithImpl<$Res,
        $Val extends DownloadManagerState>
    implements $DownloadManagerStateCopyWith<$Res> {
  _$DownloadManagerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? downloads = null,
  }) {
    return _then(_value.copyWith(
      downloads: null == downloads
          ? _value.downloads
          : downloads // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DownloadManagerStateCopyWith<$Res>
    implements $DownloadManagerStateCopyWith<$Res> {
  factory _$$_DownloadManagerStateCopyWith(_$_DownloadManagerState value,
          $Res Function(_$_DownloadManagerState) then) =
      __$$_DownloadManagerStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<dynamic> downloads});
}

/// @nodoc
class __$$_DownloadManagerStateCopyWithImpl<$Res>
    extends _$DownloadManagerStateCopyWithImpl<$Res, _$_DownloadManagerState>
    implements _$$_DownloadManagerStateCopyWith<$Res> {
  __$$_DownloadManagerStateCopyWithImpl(_$_DownloadManagerState _value,
      $Res Function(_$_DownloadManagerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? downloads = null,
  }) {
    return _then(_$_DownloadManagerState(
      downloads: null == downloads
          ? _value._downloads
          : downloads // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc

class _$_DownloadManagerState implements _DownloadManagerState {
  const _$_DownloadManagerState({required final List<dynamic> downloads})
      : _downloads = downloads;

  final List<dynamic> _downloads;
  @override
  List<dynamic> get downloads {
    if (_downloads is EqualUnmodifiableListView) return _downloads;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_downloads);
  }

  @override
  String toString() {
    return 'DownloadManagerState(downloads: $downloads)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DownloadManagerState &&
            const DeepCollectionEquality()
                .equals(other._downloads, _downloads));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_downloads));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DownloadManagerStateCopyWith<_$_DownloadManagerState> get copyWith =>
      __$$_DownloadManagerStateCopyWithImpl<_$_DownloadManagerState>(
          this, _$identity);
}

abstract class _DownloadManagerState implements DownloadManagerState {
  const factory _DownloadManagerState(
      {required final List<dynamic> downloads}) = _$_DownloadManagerState;

  @override
  List<dynamic> get downloads;
  @override
  @JsonKey(ignore: true)
  _$$_DownloadManagerStateCopyWith<_$_DownloadManagerState> get copyWith =>
      throw _privateConstructorUsedError;
}
