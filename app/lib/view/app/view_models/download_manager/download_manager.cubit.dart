import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:bloc/bloc.dart';

import 'package:booksly/config/injector.dart';
import 'package:download_manager/main.dart';
import 'package:opds_catalog/main.dart';
import 'package:settings/main.dart';

import 'download_manager.state.dart';

@injectable
class DownloadManagerCubit extends Cubit<DownloadManagerState> {
  final DownloadManagerRepository _downloadManagerRepository = getIt<DownloadManagerRepository>();
  final SettingsRepository _settingsRepository = getIt<SettingsRepository>();
  final List<StreamSubscription> _listeners = [];

  DownloadManagerCubit() : 
  super(
    const DownloadManagerState(downloads: [])
  ) {
    _registerListeners();
  }

  @override
  close() async {
    _cancelListeners();
    super.close();
  }

  _cancelListeners() {
    for (var listener in _listeners) { 
      listener.cancel(); 
    }
  }

  _registerListeners() {
    _listeners.add(
      _downloadManagerRepository.eventBus.on<DownloadQueueUpdated>()
        .listen((event) {
          emit(state.copyWith(downloads: _downloadManagerRepository.downloads));
        })
    );
  }

  downloadBook(OpdsLinkDownload link, String title) async {
    final savePath = await _settingsRepository.getLocalLibPath();

    _downloadManagerRepository.addToDownload(link.uri, title, savePath, link.extension.name);
  }
}