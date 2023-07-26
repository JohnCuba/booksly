import 'package:booksly/config/injector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opds_catalog/main.dart';
import 'package:settings/main.dart';

import 'opds_library.state.dart';

class OpdsLibraryCubit extends Cubit<OpdsLibraryState> {
  final SettingsRepository _settingsRepository = getIt<SettingsRepository>();
  final OpdsCatalogRepository _opdsCatalogRepository = getIt<OpdsCatalogRepository>();

  OpdsLibraryCubit(String librarySlug) :
  super(const OpdsLibraryState(isLoading: true, history: [])) {
    _init(librarySlug);
  }

  _init(String slug) async {
    await _settingsRepository.init();
    final OpdsLibrary library = await _getOpdsLibrary(slug);
    _opdsCatalogRepository.init(library);
    final page = await _opdsCatalogRepository.loadPage();
    final history = [...state.history];
    history.add(HistoryRecord(
      uri: Uri.parse(_opdsCatalogRepository.libraryBasePath),
      title: 'Home',
    ));

    emit(state.copyWith(
      isLoading: false,
      library: library,
      history: history,
      page: page,
    ));
  }

  Future<OpdsLibrary> _getOpdsLibrary(String slug) {
    return _settingsRepository.getOpdsLibrary(slug);
  }

  _loadPage(List<HistoryRecord> history) async {
    emit(state.copyWith(isLoading: true));

    final page = await _opdsCatalogRepository.loadPage(history.last.uri);

    emit(state.copyWith(
      isLoading: false,
      page: page,
      history: history,
    ));
  }

  goToInHistory(int index) {
    final history = [...state.history];
    history.removeRange(index + 1, history.length);

    _loadPage(history);
  }

  goTo(Uri uri, String title) {
    final newHistoryRecord = HistoryRecord(uri: uri, title: title);
    final history = [...state.history];

    history.add(newHistoryRecord);

    _loadPage(history);
  }
}