import 'package:hive/hive.dart';

part 'settings.model.g.dart';

@HiveType(typeId: 1)
class Settings extends HiveObject {
  Settings({this.localLibPath = ''});

  @HiveField(0, defaultValue: '')
  String localLibPath;
}
