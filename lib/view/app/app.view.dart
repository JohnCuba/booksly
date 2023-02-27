import 'package:booksly/config/injector.dart';
import 'package:booksly/config/localization.config.dart';
import 'package:booksly/view/app/navigation.cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    final appRouter = context.select((NavigationCubit cubit) => cubit.router);
    final pages = context.select((NavigationCubit cubit) => cubit.state.pages);
    final pageIndex =
        context.select((NavigationCubit cubit) => cubit.state.pageIndex);

    return MacosApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
      theme: MacosThemeData.dark(),
      builder: (context, child) {
        return MacosWindow(
          sidebar: Sidebar(
            isResizable: false,
            minWidth: 200,
            builder: (context, scrollController) {
              return SidebarItems(
                  items: pages
                      .map((e) =>
                          SidebarItem(label: Text(tr('pages.${e.name}'))))
                      .toList(),
                  currentIndex: pageIndex,
                  onChanged: (value) {
                    appRouter.navigateNamed(pages[value].path);
                  });
            },
          ),
          child: child,
        );
      },
    );
  }
}
