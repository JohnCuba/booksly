import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:common/extensions/main.dart';
import 'package:settings/models/main.dart';
import 'package:settings/service/settings_api.dart';

import 'settings.event.dart';

@singleton
class SettingsRepository {
  Future<SettingsApi> get _settingsApi => GetIt.I.getAsync<SettingsApi>();
  final EventBus<SettingsRepositoryEvent> eventBus = EventBus<SettingsRepositoryEvent>();

  SettingsRepository() {
    initDefaults();
  }

  initDefaults() async {
    final settings = await (await _settingsApi).getSettings();

    if (!settings.isAlreadyCalled) {
      _saveSettings(await _getDefaultSettings());
      _saveOpdsLibrary(_getDefaultLibrary());
    }
  }

  Future<Settings> getSettings() {
    return _settingsApi.then((value) => value.getSettings());
  }

  Future<Settings> _saveSettings(Settings settings) async {
    await _settingsApi.then((value) => value.saveSettings(settings));
    final newSettings = await _settingsApi.then((value) => value.getSettings());

    eventBus.fire(SettingsUpdate(newSettings));

    return newSettings;
  }

  Future<Settings> saveLocalLibPath(String localLibPath) async {
    final settings = Settings(
      localLibPath: localLibPath,
      isAlreadyCalled: true,
    );

    return _saveSettings(settings);
  }

  Future<List<OpdsLibrary>> getOpdsLibraries() {
    return _settingsApi.then((value) => value.getOpdsLibraries());
  }

  Future<OpdsLibrary> getOpdsLibrary(String slug) async {
    return getOpdsLibraries().then((libList) => libList.firstWhere((lib) => lib.slug == slug));
  }

  Future<OpdsLibrary> _saveOpdsLibrary(OpdsLibrary opdLibrary) async {
    await _settingsApi.then((value) => value.addOpdsLibrary(opdLibrary));

    eventBus.fire(OpdsLibrariesUpdate());
    return opdLibrary;
  }

  Future<OpdsLibrary> addOpdsLibrary(String uri) async {
    final opdLibrary = await OpdsLibrary.parseUri(uri);

    return _saveOpdsLibrary(opdLibrary);
  }

  Future<void> removeOpdsLibrary(OpdsLibrary library) async {
    await _settingsApi.then((value) => value.removeOpdsLibrary(library));
    eventBus.fire(OpdsLibrariesUpdate());
  }

  Future<Settings> _getDefaultSettings() async {
    var localLibraryPath = await getDownloadsDirectory();
    localLibraryPath ??= await getApplicationDocumentsDirectory();

    return Settings(
      localLibPath: localLibraryPath.path,
      isAlreadyCalled: true,
    );
  }

  OpdsLibrary _getDefaultLibrary() {
    return OpdsLibrary(
        uri: 'https://coollib.net/opds',
        title: 'Coollib',
        slug: 'coollib'
      );
  }
}
