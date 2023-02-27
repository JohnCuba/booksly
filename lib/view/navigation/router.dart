import 'package:flutter/widgets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:booksly/view/pages/local_library/local_library.page.dart';
import 'package:booksly/view/pages/settings/settings.page.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute<Widget>>[
    AutoRoute(
        name: LocalLibraryPage.name,
        path: LocalLibraryPage.path,
        page: LocalLibraryPage,
        initial: LocalLibraryPage.initial),
    AutoRoute(
        name: SettingsPage.name,
        path: SettingsPage.path,
        page: SettingsPage,
        initial: SettingsPage.initial),
  ],
)
class AppRouter extends _$AppRouter {}
