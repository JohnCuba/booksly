import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:booksly/view/app/app_page.dart';
import 'package:booksly/view/navigation/router.dart';
import 'package:booksly/view/pages/local_library/local_library.page.dart';
import 'package:booksly/view/pages/settings/settings.page.dart';
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
  final AppRouter router = AppRouter();
  final List<AppPage> pages = [];

  NavigationCubit() : super(const NavigationState(pageIndex: 0, pages: [])) {
    _createAppPages();
    router.addListener(_routeChangeListener);
  }

  _createAppPages() {
    emit(NavigationState(pageIndex: state.pageIndex, pages: const [
      AppPage(name: LocalLibraryPage.name, path: LocalLibraryPage.path),
      AppPage(name: SettingsPage.name, path: SettingsPage.path)
    ]));
  }

  _routeChangeListener() {
    emit(NavigationState(
        pageIndex: max(
            state.pages
                .indexWhere((element) => element.path == router.current.path),
            0),
        pages: state.pages));
  }
}
