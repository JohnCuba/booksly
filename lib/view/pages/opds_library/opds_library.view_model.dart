import 'package:booksly/config/injector.dart';
import 'package:booksly/data/settings/models/opds_library.model.dart';
import 'package:booksly/domain/opds_library/opds_library.repository.dart';
import 'package:booksly/domain/settings/settings.repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'opds_library.state.dart';

class OpdsLibraryViewModel extends Cubit<OpdsLibraryState> {
  final SettingsRepository _settingsRepository = getIt<SettingsRepository>();
  final OpdsLibraryRepository _opdsLibraryRepository = getIt<OpdsLibraryRepository>();

  OpdsLibraryViewModel(String librarySlug) : super(const OpdsLibraryState(isLoading: true)) {
    _init(librarySlug);
  }

  _init(String slug) async {
    await _settingsRepository.init();
    final OpdsLibrary library = await _getOpdsLibrary(slug);
    _opdsLibraryRepository.init(library);
    final page = await _opdsLibraryRepository.loadPage();

    emit(state.copyWith(
      isLoading: false,
      library: library,
      page: page,
    ));
  }

  Future<OpdsLibrary> _getOpdsLibrary(String slug) {
    return _settingsRepository.getOpdsLibrary(slug);
  }

  goTo(String path) async {
    emit(state.copyWith(isLoading: true));

    final page = await _opdsLibraryRepository.loadPage(path);

    emit(state.copyWith(
      isLoading: false,
      page: page,
    ));
  }
}