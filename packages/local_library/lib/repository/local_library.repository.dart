import 'package:injectable/injectable.dart';
import 'package:local_library/models/local_book.model.dart';
import 'package:local_library/services/local_library_api.dart';

@injectable
class LocalLibraryRepository {
  final LocalLibraryApi _localLibraryApi;

  LocalLibraryRepository(this._localLibraryApi);

  Future<List<LocalBook>> getBooks(String localLibPath) {
    return _localLibraryApi
        .readFilesList(localLibPath)
        .then((value) => value.toList());
  }
}
