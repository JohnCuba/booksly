import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:booksly/domain/settings/settings.event.dart';
import 'package:booksly/domain/settings/settings.repository.dart';
import 'package:booksly/view/app/app_page.dart';
import 'package:booksly/view/navigation/router.dart';
import 'package:booksly/view/pages/local_library/local_library.page.dart';
import 'package:booksly/view/pages/settings/settings.page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

class NavigationState extends Equatable {
  final int pageIndex;
  final List<AppPage> pages;

  const NavigationState({
    required this.pageIndex,
    required this.pages,
  });

  @override
  List<Object?> get props => [pageIndex, pages];
}

@injectable
class NavigationCubit extends Cubit<NavigationState> {
  final SettingsRepository _settingsRepository;
  final AppRouter router = AppRouter();
  final List<StreamSubscription> _listeners = []; 

  NavigationCubit(this._settingsRepository) : super(const NavigationState(pageIndex: 0, pages: [])) {
    _init();
    router.addListener(_routeChangeListener);
  }

  @override
  close() async {
    _cancelListeners();
    super.close();
  }

  _init() async {
    await _settingsRepository.init();
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

    emit(NavigationState(
      pageIndex: state.pageIndex, 
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
      NavigationState(
        pageIndex: max(pageIndex, 0),
        pages: state.pages
      )
    );
  }
}
