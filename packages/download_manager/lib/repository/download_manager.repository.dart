import 'package:injectable/injectable.dart';
import 'package:common/extensions/main.dart';

import '../models/download_task.model.dart';
import '../services/downloader.api.dart';
import 'download_manager.events.dart';

@injectable
class DownloadManagerRepository {
  final DownloaderApi _downloaderApi;
  final EventBus<DownloadManagerEvent> eventBus = EventBus<DownloadManagerEvent>();
  late ActiveQueue<DownloadTask> _downloadQueue;
  List<ActiveQueueEntity<DownloadTask>> get downloads => _downloadQueue.queue;

  DownloadManagerRepository(this._downloaderApi) {
    _downloadQueue = ActiveQueue<DownloadTask>(
      runner: _downloaderApi.downloadBook,
      onUpdate: _handleUpdateQueue
    );
  }

  _handleUpdateQueue() {
    eventBus.fire(DownloadQueueUpdated());
  }

  addToDownload(Uri uri, String title, String savePath, String extension) {
    final task = DownloadTask(
      uri: uri,
      title: title,
      extension: extension,
      savePath: savePath,
    );

    _downloadQueue.add(task);
  }
}