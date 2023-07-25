// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'opds_library.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OpdsLibraryState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<HistoryRecord> get history => throw _privateConstructorUsedError;
  OpdsLibrary? get library => throw _privateConstructorUsedError;
  OpdsPage? get page => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OpdsLibraryStateCopyWith<OpdsLibraryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpdsLibraryStateCopyWith<$Res> {
  factory $OpdsLibraryStateCopyWith(
          OpdsLibraryState value, $Res Function(OpdsLibraryState) then) =
      _$OpdsLibraryStateCopyWithImpl<$Res, OpdsLibraryState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<HistoryRecord> history,
      OpdsLibrary? library,
      OpdsPage? page});
}

/// @nodoc
class _$OpdsLibraryStateCopyWithImpl<$Res, $Val extends OpdsLibraryState>
    implements $OpdsLibraryStateCopyWith<$Res> {
  _$OpdsLibraryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? history = null,
    Object? library = freezed,
    Object? page = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      history: null == history
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<HistoryRecord>,
      library: freezed == library
          ? _value.library
          : library // ignore: cast_nullable_to_non_nullable
              as OpdsLibrary?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as OpdsPage?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OpdsLibraryStateCopyWith<$Res>
    implements $OpdsLibraryStateCopyWith<$Res> {
  factory _$$_OpdsLibraryStateCopyWith(
          _$_OpdsLibraryState value, $Res Function(_$_OpdsLibraryState) then) =
      __$$_OpdsLibraryStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<HistoryRecord> history,
      OpdsLibrary? library,
      OpdsPage? page});
}

/// @nodoc
class __$$_OpdsLibraryStateCopyWithImpl<$Res>
    extends _$OpdsLibraryStateCopyWithImpl<$Res, _$_OpdsLibraryState>
    implements _$$_OpdsLibraryStateCopyWith<$Res> {
  __$$_OpdsLibraryStateCopyWithImpl(
      _$_OpdsLibraryState _value, $Res Function(_$_OpdsLibraryState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? history = null,
    Object? library = freezed,
    Object? page = freezed,
  }) {
    return _then(_$_OpdsLibraryState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      history: null == history
          ? _value._history
          : history // ignore: cast_nullable_to_non_nullable
              as List<HistoryRecord>,
      library: freezed == library
          ? _value.library
          : library // ignore: cast_nullable_to_non_nullable
              as OpdsLibrary?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as OpdsPage?,
    ));
  }
}

/// @nodoc

class _$_OpdsLibraryState implements _OpdsLibraryState {
  const _$_OpdsLibraryState(
      {required this.isLoading,
      required final List<HistoryRecord> history,
      this.library,
      this.page})
      : _history = history;

  @override
  final bool isLoading;
  final List<HistoryRecord> _history;
  @override
  List<HistoryRecord> get history {
    if (_history is EqualUnmodifiableListView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_history);
  }

  @override
  final OpdsLibrary? library;
  @override
  final OpdsPage? page;

  @override
  String toString() {
    return 'OpdsLibraryState(isLoading: $isLoading, history: $history, library: $library, page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OpdsLibraryState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._history, _history) &&
            (identical(other.library, library) || other.library == library) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_history), library, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OpdsLibraryStateCopyWith<_$_OpdsLibraryState> get copyWith =>
      __$$_OpdsLibraryStateCopyWithImpl<_$_OpdsLibraryState>(this, _$identity);
}

abstract class _OpdsLibraryState implements OpdsLibraryState {
  const factory _OpdsLibraryState(
      {required final bool isLoading,
      required final List<HistoryRecord> history,
      final OpdsLibrary? library,
      final OpdsPage? page}) = _$_OpdsLibraryState;

  @override
  bool get isLoading;
  @override
  List<HistoryRecord> get history;
  @override
  OpdsLibrary? get library;
  @override
  OpdsPage? get page;
  @override
  @JsonKey(ignore: true)
  _$$_OpdsLibraryStateCopyWith<_$_OpdsLibraryState> get copyWith =>
      throw _privateConstructorUsedError;
}
