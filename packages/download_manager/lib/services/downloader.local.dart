import 'package:path/path.dart' as p;
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:translit/translit.dart';

import 'downloader.api.dart';

@Injectable(as: DownloaderApi)
class DownloaderLocal implements DownloaderApi {
  final Dio _dio = Dio();

  @override
  downloadBook(entity) async {
    final savePath = p.join(
        entity.savePath,
        Translit().toTranslit(source: '${entity.title}.${entity.extension}'),
    );

    await _dio.downloadUri(
        entity.uri,
        savePath,
    );
  }
}