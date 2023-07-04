import 'package:booksly/config/injector.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:booksly/data/settings/models/opds_library.model.dart';
import 'package:booksly/domain/settings/settings.repository.dart';

import 'settings.state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepository _settingsRepository = getIt<SettingsRepository>();

  SettingsCubit() :
  super(const SettingsState()) {
    _init();
  }

  _init() async {
    await _settingsRepository.init();

    emit(state.copyWith(
      settings: await _settingsRepository.getSettings(),
      opdsLibraies: await _settingsRepository.getOpdsLibraries()
    ));
  }

  changeLocalLibraryPath() async {
    String? result = await FilePicker.platform
        .getDirectoryPath(dialogTitle: 'Укажи путь к электронной книге');

    if (result != null) {
      emit(state.copyWith(
        settings: await _settingsRepository.saveSettings(localLibPath: result),
      ));
    }
  }

  addOpdsLibrary(String uri) async {
    await _settingsRepository.addOpdsLibrary(uri);
    emit(state.copyWith(
      opdsLibraies: await _settingsRepository.getOpdsLibraries()
    ));
  }

  removeOpdsLibrary(OpdsLibrary library) async {
    await _settingsRepository.removeOpdsLibrary(library);
    emit(state.copyWith(
      opdsLibraies: await _settingsRepository.getOpdsLibraries()
    ));
  }
}