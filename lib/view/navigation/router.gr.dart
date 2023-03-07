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
    Opds_library.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<Opds_libraryArgs>(
          orElse: () =>
              Opds_libraryArgs(librarySlug: pathParams.getString('slug')));
      return MaterialPageX<Widget>(
        routeData: routeData,
        child: OpdsLibraryPage(
          key: args.key,
          librarySlug: args.librarySlug,
        ),
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
        RouteConfig(
          Opds_library.name,
          path: '/opds/:slug',
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

/// generated route for
/// [OpdsLibraryPage]
class Opds_library extends PageRouteInfo<Opds_libraryArgs> {
  Opds_library({
    Key? key,
    required String librarySlug,
  }) : super(
          Opds_library.name,
          path: '/opds/:slug',
          args: Opds_libraryArgs(
            key: key,
            librarySlug: librarySlug,
          ),
          rawPathParams: {'slug': librarySlug},
        );

  static const String name = 'Opds_library';
}

class Opds_libraryArgs {
  const Opds_libraryArgs({
    this.key,
    required this.librarySlug,
  });

  final Key? key;

  final String librarySlug;

  @override
  String toString() {
    return 'Opds_libraryArgs{key: $key, librarySlug: $librarySlug}';
  }
}
