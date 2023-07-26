import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:booksly/config/injector.dart';
import 'package:local_library/main.dart';
import 'package:settings/main.dart';

import 'local_library.state.dart';

@injectable
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

    final localLibPath = await _settingsRepository.getLocalLibPath();
    final files = await _localLibraryRepository.getBooks(localLibPath);

    emit(state.copyWith(
        isLoading: false,
        localLibPath: localLibPath,
        files: files
    ));
  }

  deleteBook(LocalBook book) async {
    await book.file.delete();
    await update();
  }
}