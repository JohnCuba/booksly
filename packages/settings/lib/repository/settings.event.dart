import 'package:settings/models/main.dart';

abstract class SettingsRepositoryEvent {}

class SettingsUpdate implements SettingsRepositoryEvent {
  final Settings payload;
  SettingsUpdate(this.payload);
}

class OpdsLibrariesUpdate implements SettingsRepositoryEvent {}