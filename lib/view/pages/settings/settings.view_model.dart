import 'package:bloc/bloc.dart';
import 'package:booksly/data/settings/models/opds_library.model.dart';
import 'package:booksly/data/settings/models/settings.model.dart';
import 'package:booksly/domain/settings/settings.repository.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';

class SettingsState extends Equatable {
  final Settings? settings;
  final List<OpdsLibrary>? opdsLibraies;

  const SettingsState({
    this.settings,
    this.opdsLibraies,
  });

  @override
  List<Object?> get props => [settings, opdsLibraies];
}

@singleton
class SettingsViewModel extends Cubit<SettingsState> {
  final SettingsRepository _settingsRepository;

  SettingsViewModel(this._settingsRepository) : super(const SettingsState()) {
    _init();
  }

  _init() async {
    await _settingsRepository.init();

    emit(SettingsState(
      settings: await _settingsRepository.getSettings(),
      opdsLibraies: await _settingsRepository.getOpdsLibraries()
    ));
  }

  changeLocalLibraryPath() async {
    String? result = await FilePicker.platform
        .getDirectoryPath(dialogTitle: 'Укажи путь к электронной книге');

    if (result != null) {
      emit(SettingsState(
        settings: await _settingsRepository.saveSettings(localLibPath: result),
        opdsLibraies: state.opdsLibraies
      ));
    }
  }

  addOpdsLibrary(String uri) async {
    await _settingsRepository.addOpdsLibrary(uri);
    emit(SettingsState(
      settings: state.settings,
      opdsLibraies: await _settingsRepository.getOpdsLibraries()
    ));
  }

  removeOpdsLibrary(OpdsLibrary library) async {
    await _settingsRepository.removeOpdsLibrary(library);
    emit(SettingsState(
      settings: state.settings,
      opdsLibraies: await _settingsRepository.getOpdsLibraries()
    ));
  }
}
