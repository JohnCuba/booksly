import 'package:booksly/data/local_library/models/local_book.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_library.state.freezed.dart';

@freezed
class LocalLibraryState with _$LocalLibraryState {
  const factory LocalLibraryState({
    required bool isLoading,
    required String localLibPath,
    required List<LocalBook> files,
  }) = _LocalLibraryState;
}