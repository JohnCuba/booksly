import 'package:booksly/config/injector.dart';
import 'package:booksly/config/localization.dart';
import 'package:booksly/view/app/navigation.cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macos_ui/macos_ui.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<NavigationCubit>(
              create: (_) => getIt.get<NavigationCubit>())
        ],
        child: EasyLocalization(
            supportedLocales: supportedLocales,
            fallbackLocale: supportedLocales.first,
            path: pathToTranslationsFiles,
            child: const AppView()));
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = context.read<NavigationCubit>().router;
    final navigationState = context.watch<NavigationCubit>().state;

    return MacosApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
      themeMode: ThemeMode.light,
      builder: (context, child) {
        return MacosWindow(
          sidebar: Sidebar(
            isResizable: false,
            minWidth: 200,
            builder: (context, scrollController) {
              return SidebarItems(
                  items: navigationState.pages
                      .map((e) => SidebarItem(label: Text(e.name)))
                      .toList(),
                  currentIndex: navigationState.pageIndex,
                  onChanged: (value) {
                    appRouter.navigateNamed(navigationState.pages[value].path);
                  });
            },
          ),
          child: child,
        );
      },
    );
  }
}
