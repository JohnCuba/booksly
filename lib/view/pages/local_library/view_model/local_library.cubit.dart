import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:booksly/config/injector.dart';
import 'package:booksly/data/local_library/models/local_book.model.dart';
import 'package:booksly/domain/local_library/local_library.repository.dart';
import 'package:booksly/domain/settings/settings.event.dart';
import 'package:booksly/domain/settings/settings.repository.dart';

import 'local_library.state.dart';

class LocalLibraryCubit extends Cubit<LocalLibraryState> {
  final LocalLibraryRepository _localLibraryRepository = getIt<LocalLibraryRepository>();
  final SettingsRepository _settingsRepository = getIt<SettingsRepository>();
  final List<StreamSubscription> _listeners = [];

  LocalLibraryCubit() :
  super(const LocalLibraryState(isLoading: false, localLibPath: '', files: [])) {
    _init();
  }

  @override
  close() async {
    _cancelListeners();
    super.close();
  }

  _init() async {
    await _settingsRepository.init();
    _registerListeners();
    update();
  }

  _registerListeners() {
    _listeners.add(
      _settingsRepository.eventBus.on<SettingsUpdate>()
        .listen((event) {
          update();
        })
    );
  }

  _cancelListeners() {
    for (var listener in _listeners) { 
      listener.cancel(); 
    }
  }

  update() async {
    emit(state.copyWith(isLoading: true));
    final localLibPath =
        await _settingsRepository.getSettings().then((value) => value.localLibPath);

    _localLibraryRepository.getBooks(localLibPath).then((value) {
      emit(
        state.copyWith(
          isLoading: false,
          localLibPath: localLibPath,
          files: value
        )
      );
    });
  }

  deleteBook(LocalBook book) async {
    await book.file.delete();
    await update();
  }
}