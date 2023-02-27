import 'package:booksly/data/local_library/local_library_api.dart';
import 'package:booksly/data/local_library/models/local_book.model.dart';
import 'package:injectable/injectable.dart';

@singleton
class LocalLibraryRepository {
  final LocalLibraryApi _localLibraryApi;

  LocalLibraryRepository(this._localLibraryApi);

  Future<List<LocalBook>> getBooks(String localLibPath) {
    return _localLibraryApi
        .readFilesList(localLibPath)
        .then((value) => value.toList());
  }
}
