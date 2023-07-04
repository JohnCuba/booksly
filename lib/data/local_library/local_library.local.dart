import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:booksly/config/consts.dart';
import 'package:booksly/data/local_library/local_library_api.dart';
import 'package:booksly/data/local_library/models/local_book.model.dart';
import 'package:translit/translit.dart';

@Injectable(as: LocalLibraryApi)
class LocalLibraryLocal implements LocalLibraryApi {
  final Dio _dio = Dio();

  @override
  readFilesList(String path) {
    return Directory(path)
        .list()
        .where(_checkIsSupportedExtension)
        .asyncMap((event) => LocalBook.parseFile(event.path))
        .toList();
  }

  @override
  downloadBook(entity) async {
    final savePath = p.join(
        entity.savePath,
        Translit().toTranslit(source: '${entity.title}.${entity.extension.name}'),
    );

    await _dio.downloadUri(
        entity.uri,
        savePath,
    );
  }

  static bool _checkIsSupportedExtension(FileSystemEntity entity) {
    return SupportedExtensions.values
        .any((exception) => entity.path.endsWith(exception.name));
  }
}
