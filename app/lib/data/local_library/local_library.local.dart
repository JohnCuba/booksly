import 'dart:io';
import 'package:injectable/injectable.dart';

import 'package:common/config/supported_extensions.dart';
import 'package:booksly/data/local_library/local_library_api.dart';
import 'package:booksly/data/local_library/models/local_book.model.dart';

@Injectable(as: LocalLibraryApi)
class LocalLibraryLocal implements LocalLibraryApi {

  @override
  readFilesList(String path) {
    return Directory(path)
        .list()
        .where(_checkIsSupportedExtension)
        .asyncMap((event) => LocalBook.parseFile(event.path))
        .toList();
  }

  static bool _checkIsSupportedExtension(FileSystemEntity entity) {
    return SupportedExtensions.values
        .any((exception) => entity.path.endsWith(exception.name));
  }
}
