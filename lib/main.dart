import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:booksly/view/app/app.view.dart';
import 'config/injector.dart';

void main() async {
  await Hive.initFlutter(); // Init Hive storage
  await EasyLocalization.ensureInitialized(); // Ensure localization are init
  WidgetsFlutterBinding.ensureInitialized(); // Ensure widgets are init
  configureDependencies(); // Init DI
  runApp(const App());
}
