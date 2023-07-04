import 'package:booksly/view/pages/opds_library/opds_library.page.dart';
import 'package:flutter/widgets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:booksly/view/pages/local_library/local_library.page.dart';
import 'package:booksly/view/pages/settings/settings.page.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
        path: LocalLibraryPage.path,
        page: Local_library.page,
        initial: LocalLibraryPage.initial),
    AutoRoute(
        path: SettingsPage.path,
        page: Settings.page,
        initial: SettingsPage.initial),
    AutoRoute(
        path: OpdsLibraryPage.path,
        page: Opds_library.page,
        initial: OpdsLibraryPage.initial),
  ];
}
