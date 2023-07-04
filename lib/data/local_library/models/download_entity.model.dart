import 'package:booksly/config/consts.dart';

class DownloadEntity {
  final Uri uri;
  final String title;
  final SupportedExtensions extension;
  final String savePath;
  int progress = 0;

  DownloadEntity({
    required this.uri,
    required this.title,
    required this.extension,
    required this.savePath,
  });

  updateProgress(int value) {
    progress = value;
  }
}