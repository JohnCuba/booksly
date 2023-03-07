import 'package:booksly/data/opds/models/opds_page.model.dart';
import 'package:booksly/data/settings/models/opds_library.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'opds_library.state.freezed.dart';

@freezed
class OpdsLibraryState with _$OpdsLibraryState {
  const factory OpdsLibraryState({
    required bool isLoading,
    OpdsLibrary? library,
    OpdsPage? page,
  }) = _OpdsLibraryState;
}
