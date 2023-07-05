import 'package:injectable/injectable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:booksly/config/injector.dart';
import 'package:booksly/data/settings/models/opds_library.model.dart';
import 'package:booksly/domain/settings/settings.repository.dart';

import 'settings.state.dart';

@injectable
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

  Future<bool> changeLocalLibraryPath() async {
    final result = await FilePicker.platform
        .getDirectoryPath(dialogTitle: 'Укажи путь к электронной книге');
    
    if (result == null) {
      return false;
    }

    emit(state.copyWith(
      settings: await _settingsRepository.saveSettings(result),
    ));

    return true;
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
