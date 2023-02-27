// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    Local_library.name: (routeData) {
      return MaterialPageX<Widget>(
        routeData: routeData,
        child: const LocalLibraryPage(),
      );
    },
    Settings.name: (routeData) {
      return MaterialPageX<Widget>(
        routeData: routeData,
        child: const SettingsPage(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/local_library',
          fullMatch: true,
        ),
        RouteConfig(
          Local_library.name,
          path: '/local_library',
        ),
        RouteConfig(
          Settings.name,
          path: '/settings',
        ),
      ];
}

/// generated route for
/// [LocalLibraryPage]
class Local_library extends PageRouteInfo<void> {
  const Local_library()
      : super(
          Local_library.name,
          path: '/local_library',
        );

  static const String name = 'Local_library';
}

/// generated route for
/// [SettingsPage]
class Settings extends PageRouteInfo<void> {
  const Settings()
      : super(
          Settings.name,
          path: '/settings',
        );

  static const String name = 'Settings';
}
