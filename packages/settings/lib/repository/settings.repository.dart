import 'package:injectable/injectable.dart';
import 'package:common/extensions/main.dart';
import 'package:settings/main.dart';
import 'package:settings/service/settings_api.dart';

import 'settings.event.dart';

@injectable
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

  Future<Settings> saveSettings(String localLibPath) async {
    final settings = Settings(
      localLibPath: localLibPath
    );

    await _settingsApi.saveSettings(settings);
    eventBus.fire(SettingsUpdate());
    return _settingsApi.getSettings();
  }

  Future<String> getLocalLibPath() async {
    final settings = await _settingsApi.getSettings();
    return settings.localLibPath;
  }

  Future<List<OpdsLibrary>> getOpdsLibraries() {
    return _settingsApi.getOpdsLibraries();
  }

  Future<OpdsLibrary> getOpdsLibrary(String slug) async {
    return getOpdsLibraries().then((libList) => libList.firstWhere((lib) => lib.slug == slug));
  }

  Future<OpdsLibrary> addOpdsLibrary(String uri) async {
    final opdLibrary = await OpdsLibrary.parseUri(uri);
    await _settingsApi.addOpdsLibrary(opdLibrary);

    eventBus.fire(OpdsLibrariesUpdate());
    return opdLibrary;
  }

  Future<void> removeOpdsLibrary(OpdsLibrary library) async {
    await _settingsApi.removeOpdsLibrary(library);
    eventBus.fire(OpdsLibrariesUpdate());
  }
}
