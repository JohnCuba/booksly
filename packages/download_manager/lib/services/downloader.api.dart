import '../models/download_task.model.dart';

abstract class DownloaderApi {
  const DownloaderApi();

  Future<void> downloadBook(DownloadTask task, void Function()? onReceiveProgress);
}