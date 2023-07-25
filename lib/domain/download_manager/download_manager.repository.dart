import 'package:booksly/lib/utils/active_queue.dart';
import 'package:booksly/lib/utils/event_bus.dart';
import 'package:injectable/injectable.dart';
import 'package:booksly/data/downloader/downloader.api.dart';
import 'package:booksly/data/opds/models/opds_link.model.dart';
import 'package:booksly/data/downloader/models/download_task.model.dart';

import 'download_manager.events.dart';

@injectable
class DownloadManagerRepository {
  final DownloaderApi _downloaderApi;
  final EventBus eventBus = EventBus();
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

  addToDownload(OpdsLinkDownload link, String title, String savePath) {
    final task = DownloadTask(
      uri: link.uri,
      title: title,
      extension: link.extension,
      savePath: savePath,
    );

    _downloadQueue.add(task);
  }
}