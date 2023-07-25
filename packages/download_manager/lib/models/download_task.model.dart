class DownloadTask {
  final Uri uri;
  final String title;
  final String extension;
  final String savePath;
  int progress = 0;

  DownloadTask({
    required this.uri,
    required this.title,
    required this.extension,
    required this.savePath,
  });

  updateProgress(int value) {
    progress = value;
  }
}