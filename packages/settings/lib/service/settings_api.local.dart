import 'package:injectable/injectable.dart';
import 'package:hive/hive.dart';

import 'package:settings/models/main.dart';
import 'settings_api.dart';

@LazySingleton(as: SettingsApi)
class LocalSettingsApi implements SettingsApi {
  static const String hiveRootBoxName = 'settings';
  static const String hiveOpdsLibrariesBoxName = '${hiveRootBoxName}_opdsLibraries';
  final LazyBox<Settings> hiveSettingsBox;
  final Box<OpdsLibrary> hiveOpdsLibrariesBox;

  LocalSettingsApi({
    required this.hiveSettingsBox,
    required this.hiveOpdsLibrariesBox,
  });

  static _registerAdapters() {
    if (!Hive.isAdapterRegistered(SettingsAdapter().typeId)) {
      Hive.registerAdapter(SettingsAdapter());
    }

    if (!Hive.isAdapterRegistered(OpdsLibraryAdapter().typeId)) {
      Hive.registerAdapter(OpdsLibraryAdapter());
    }
  }

  @factoryMethod
  static Future<LocalSettingsApi> init() async {
    _registerAdapters();

    return LocalSettingsApi(
      hiveSettingsBox: await Hive.openLazyBox<Settings>(hiveRootBoxName),
      hiveOpdsLibrariesBox: await Hive.openBox<OpdsLibrary>(hiveOpdsLibrariesBoxName),
    );
  }

  @override
  getSettings() async {
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
