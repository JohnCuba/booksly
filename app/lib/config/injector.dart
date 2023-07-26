import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:settings/main.dart' as settings;
import 'package:local_library/main.dart' as local_library;
import 'package:opds_catalog/main.dart' as opds_catalog;
import 'package:download_manager/main.dart' as download_manager;
import 'injector.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: false,
  asExtension: false,
)
void configureDependencies() {
  init(getIt);
  settings.configureDependencies(getIt);
  local_library.configureDependencies(getIt);
  opds_catalog.configureDependencies(getIt);
  download_manager.configureDependencies(getIt);
}
