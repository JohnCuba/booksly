import 'package:booksly/config/injector.dart';
import 'package:booksly/data/settings/models/opds_library.model.dart';
import 'package:booksly/domain/opds_library/opds_library.repository.dart';
import 'package:booksly/domain/settings/settings.repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'opds_library.state.dart';

class OpdsLibraryCubit extends Cubit<OpdsLibraryState> {
  final SettingsRepository _settingsRepository = getIt<SettingsRepository>();
  final OpdsLibraryRepository _opdsLibraryRepository = getIt<OpdsLibraryRepository>();

  OpdsLibraryCubit(String librarySlug) :
  super(const OpdsLibraryState(isLoading: true, history: [])) {
    _init(librarySlug);
  }

  _init(String slug) async {
    await _settingsRepository.init();
    final OpdsLibrary library = await _getOpdsLibrary(slug);
    _opdsLibraryRepository.init(library);
    final page = await _opdsLibraryRepository.loadPage();
    final history = [...state.history];
    history.add(HistoryRecord(
      slug: _opdsLibraryRepository.libraryBasePath,
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

    final page = await _opdsLibraryRepository.loadPage(history.last.slug);

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

  goTo(String path, String title) {
    final newHistoryRecord = HistoryRecord(slug: path, title: title);
    final history = [...state.history];

    history.add(newHistoryRecord);

    _loadPage(history);
  }
}