// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    Local_library.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LocalLibraryPage(),
      );
    },
    Settings.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsPage(),
      );
    },
    Opds_library.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<Opds_libraryArgs>(
          orElse: () =>
              Opds_libraryArgs(librarySlug: pathParams.getString('slug')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OpdsLibraryPage(
          key: args.key,
          librarySlug: args.librarySlug,
        ),
      );
    },
  };
}

/// generated route for
/// [LocalLibraryPage]
class Local_library extends PageRouteInfo<void> {
  const Local_library({List<PageRouteInfo>? children})
      : super(
          Local_library.name,
          initialChildren: children,
        );

  static const String name = 'Local_library';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsPage]
class Settings extends PageRouteInfo<void> {
  const Settings({List<PageRouteInfo>? children})
      : super(
          Settings.name,
          initialChildren: children,
        );

  static const String name = 'Settings';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OpdsLibraryPage]
class Opds_library extends PageRouteInfo<Opds_libraryArgs> {
  Opds_library({
    Key? key,
    required String librarySlug,
    List<PageRouteInfo>? children,
  }) : super(
          Opds_library.name,
          args: Opds_libraryArgs(
            key: key,
            librarySlug: librarySlug,
          ),
          rawPathParams: {'slug': librarySlug},
          initialChildren: children,
        );

  static const String name = 'Opds_library';

  static const PageInfo<Opds_libraryArgs> page =
      PageInfo<Opds_libraryArgs>(name);
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
