import 'package:local_library/models/local_book.model.dart';

abstract class LocalLibraryApi {
  const LocalLibraryApi();

  Future<List<LocalBook>> readFilesList(String path);
}
