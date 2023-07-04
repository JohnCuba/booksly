import 'package:injectable/injectable.dart';

import 'package:booksly/data/local_library/local_library_api.dart';
import 'package:booksly/data/local_library/models/local_book.model.dart';
import 'package:booksly/data/local_library/models/download_entity.model.dart';

import 'package:booksly/data/opds/models/opds_link.model.dart';

@singleton
class LocalLibraryRepository {
  final LocalLibraryApi _localLibraryApi;

  LocalLibraryRepository(this._localLibraryApi);

  Future<List<LocalBook>> getBooks(String localLibPath) {
    return _localLibraryApi
        .readFilesList(localLibPath)
        .then((value) => value.toList());
  }

  addToDownloadQueue(OpdsLinkDownload link, String title, String savePath) {
    final entity = DownloadEntity(
        uri: link.uri,
        title: title,
        savePath: savePath,
        extension: link.extension
    );

    _localLibraryApi.downloadBook(entity);
  }
}
