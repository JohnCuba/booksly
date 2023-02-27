import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:booksly/config/injector.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: false,
)
void configureDependencies() => getIt.init();
