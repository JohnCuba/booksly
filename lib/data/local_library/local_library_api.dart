import 'package:booksly/data/local_library/models/local_book.model.dart';
import 'models/download_entity.model.dart';

abstract class LocalLibraryApi {
  const LocalLibraryApi();

  Future<List<LocalBook>> readFilesList(String path);

  Future<void> downloadBook(DownloadEntity entity);
}
