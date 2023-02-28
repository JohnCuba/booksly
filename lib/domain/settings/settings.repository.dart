import 'package:booksly/data/settings/models/opds_library.model.dart';
import 'package:booksly/data/settings/models/settings.model.dart';
import 'package:booksly/data/settings/settings_api.dart';
import 'package:booksly/domain/settings/settings.event.dart';
import 'package:injectable/injectable.dart';
import 'package:booksly/lib/utils/event_bus.dart';

@singleton
class SettingsRepository {
  final SettingsApi _settingsApi;
  final EventBus eventBus = EventBus();

  SettingsRepository(this._settingsApi);

  Future<void> init() async {
    await _settingsApi.init();
  }

  Future<Settings> getSettings() {
    return _settingsApi.getSettings();
  }

  Future<Settings> saveSettings({String? localLibPath}) async {
    final currentSettings = await _settingsApi.getSettings();

    final settings = Settings(
      localLibPath: localLibPath ?? currentSettings.localLibPath
    );

    await _settingsApi.saveSettings(settings);
    eventBus.fire(SettingsUpdate());
    return _settingsApi.getSettings();
  }

  Future<List<OpdsLibrary>> getOpdsLibraries() {
    return _settingsApi.getOpdsLibraries();
  }

  Future<void> addOpdsLibrary(String uri) async {
    final opdLibrary = await OpdsLibrary.parseUri(uri);
    await _settingsApi.addOpdsLibrary(opdLibrary);
    eventBus.fire(OpdsLibrariesUpdate());
  }

  Future<void> removeOpdsLibrary(OpdsLibrary library) async {
    await _settingsApi.removeOpdsLibrary(library);
    eventBus.fire(OpdsLibrariesUpdate());
  }
}
