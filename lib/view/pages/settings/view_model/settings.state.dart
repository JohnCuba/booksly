import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:booksly/data/settings/models/opds_library.model.dart';
import 'package:booksly/data/settings/models/settings.model.dart';

part 'settings.state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    Settings? settings,
    List<OpdsLibrary>? opdsLibraies,
  }) = _SettingsState;
}