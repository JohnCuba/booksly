import 'package:booksly/data/settings/models/opds_library.model.dart';
import 'package:booksly/data/settings/models/settings.model.dart';

abstract class SettingsApi {
  const SettingsApi();

  Future<void> init();

  Future<Settings> getSettings();
  Future<void> saveSettings(Settings data);

  Future<List<OpdsLibrary>> getOpdsLibraries();
  Future<void> addOpdsLibrary(OpdsLibrary library);
  Future<void> removeOpdsLibrary(OpdsLibrary library);
}
