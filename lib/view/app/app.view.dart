import 'package:booksly/config/injector.dart';
import 'package:booksly/config/localization.dart';
import 'package:booksly/view/navigation/navigation.cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<NavigationCubit>(
            create: (_) => getIt.get<NavigationCubit>()
          )
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

    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
      themeMode: ThemeMode.light,
      builder: (context, child) {
        return Scaffold(
          body: Row(
            children: [
              Flexible(
                  flex: 2,
                  child:
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(color: Colors.black26)
                          )
                        ),
                        child: Column(
                          children: [
                            AppBar(
                              elevation: 0,
                              toolbarHeight: 40,
                              backgroundColor: Colors.transparent,
                            ),
                            ...navigationState.pages.map(
                                    (e) => ListTile(
                                  title: Text(e.name),
                                  dense: navigationState.pages[navigationState.pageIndex].path != e.path,
                                  onTap: () {
                                    appRouter.navigateNamed(e.path);
                                  },
                                )
                            ).toList()
                          ],
                        ),
                      )
              ),
              Flexible(
                  flex: 6,
                  child: child ?? const SizedBox(),
              ),
            ],
          ),
        );
      },
    );
  }
}
