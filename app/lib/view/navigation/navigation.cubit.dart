import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:booksly/config/injector.dart';
import 'package:booksly/view/app/app_page.dart';
import 'package:booksly/view/navigation/router.dart';
import 'package:booksly/view/pages/local_library/local_library.page.dart';
import 'package:booksly/view/pages/settings/settings.page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import 'package:settings/main.dart';

import 'navigation.state.dart';

@injectable
class NavigationCubit extends Cubit<NavigationState> {
  final SettingsRepository _settingsRepository = getIt.get<SettingsRepository>();
  final AppRouter router = AppRouter();
  final List<StreamSubscription> _listeners = []; 

  NavigationCubit() :
  super(const NavigationState(pageIndex: 0, pages: [])) {
    _init();
    router.addListener(_routeChangeListener);
  }

  @override
  close() async {
    _cancelListeners();
    super.close();
  }

  _init() async {
    _registerListeners();
    _updateAppPages();
  }

  _registerListeners() {
    _listeners.add(
      _settingsRepository.eventBus.on<OpdsLibrariesUpdate>()
        .listen((event) async {
          await _updateAppPages();
          _routeChangeListener();
        })
    );
  }

  _cancelListeners() {
    for (var listener in _listeners) { 
      listener.cancel(); 
    }
  }

  _updateAppPages() async {
    final libraryPages = await _settingsRepository.getOpdsLibraries()
          .then((pages) => pages
            .map((page) => AppPage(name: page.title, path: '/opds/${page.slug}')));

    emit(state.copyWith(
      pages: [
        AppPage(name: tr('pages.${LocalLibraryPage.name}'), path: LocalLibraryPage.path),
        ...libraryPages,
        AppPage(name: tr('pages.${SettingsPage.name}'), path: SettingsPage.path)
      ]
    ));
  }

  _routeChangeListener() {
    final pageIndex = state.pages.indexWhere((element) => element.path == router.current.match);
    emit(
      state.copyWith(
        pageIndex: max(pageIndex, 0),
      )
    );
  }
}