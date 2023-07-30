import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:opds_catalog/main.dart';
import 'package:settings/main.dart';

part 'opds_library.state.freezed.dart';

@freezed
class OpdsLibraryState with _$OpdsLibraryState {
  const factory OpdsLibraryState({
    required bool isLoading,
    required List<HistoryRecord> history,
    OpdsLibrary? library,
    OpdsPage? page,
  }) = _OpdsLibraryState;
}

class HistoryRecord {
  String title;
  Uri uri;
  HistoryRecord({
    required this.uri,
    required this.title,
  });
}