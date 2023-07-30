import 'package:hive/hive.dart';

part 'settings.model.g.dart';

@HiveType(typeId: 1)
class Settings extends HiveObject {
  Settings({this.localLibPath = '', this.isAlreadyCalled = false});

  @HiveField(0, defaultValue: '')
  String localLibPath;

  @HiveField(1, defaultValue: false)
  bool isAlreadyCalled;
}
