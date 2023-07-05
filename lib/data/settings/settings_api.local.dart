import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

import 'package:booksly/data/settings/models/opds_library.model.dart';
import 'package:booksly/data/settings/models/settings.model.dart';
import 'package:booksly/data/settings/settings_api.dart';

@Singleton(as: SettingsApi)
class LocalSettingsApi implements SettingsApi {
  static const String hiveRootBoxName = 'settings';
  static const String hiveOpdsLibrariesBoxName = '${hiveRootBoxName}_opdsLibraries';
  late LazyBox<Settings> hiveSettingsBox;
  late Box<OpdsLibrary> hiveOpdsLibrariesBox;

  _registerAdapters() {
    if (!Hive.isAdapterRegistered(SettingsAdapter().typeId)) {
      Hive.registerAdapter(SettingsAdapter());
    }

    if (!Hive.isAdapterRegistered(OpdsLibraryAdapter().typeId)) {
      Hive.registerAdapter(OpdsLibraryAdapter());
    }
  }

  _openBoxes() async {
    if (!Hive.isBoxOpen(hiveRootBoxName)) {
      hiveSettingsBox = await Hive.openLazyBox<Settings>(hiveRootBoxName);
    }
    if (!Hive.isBoxOpen(hiveOpdsLibrariesBoxName)) {
      hiveOpdsLibrariesBox = await Hive.openBox<OpdsLibrary>(hiveOpdsLibrariesBoxName);
    }
  }

  _getDefaultSettings() async {
    var localLibraryPath = await getDownloadsDirectory();
    localLibraryPath ??= await getApplicationDocumentsDirectory();

    return Settings(
      localLibPath: localLibraryPath.path
    );
  }

  @override
  init() async {
    _registerAdapters();
    await _openBoxes();
  }

  @override
  getSettings() async {
    if (hiveSettingsBox.isEmpty) {
      await saveSettings(
        await _getDefaultSettings()
      );
    }

    return await hiveSettingsBox.get(hiveRootBoxName) ?? Settings();
  }

  @override
  saveSettings(Settings data) async {
    await hiveSettingsBox.put(hiveRootBoxName, data);
  }

  @override
  Future<void> addOpdsLibrary(OpdsLibrary library) async {
    await hiveOpdsLibrariesBox.add(library);
  }

  @override
  Future<List<OpdsLibrary>> getOpdsLibraries() async {

    return hiveOpdsLibrariesBox.values.toList();
  }
  
  @override
  Future<void> removeOpdsLibrary(OpdsLibrary library) async {
    await library.delete();
  }
}
