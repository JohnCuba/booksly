import 'package:booksly/data/opds/models/opds_page.model.dart';
import 'package:booksly/data/opds/opds_api.dart';
import 'package:booksly/data/settings/models/opds_library.model.dart';
import 'package:injectable/injectable.dart';

@injectable
class OpdsLibraryRepository {
  final OpdsApi _opdsApi;
  late final OpdsLibrary _library;
  String get libraryTitle  => _library.title;
  String get libraryBasePath => _opdsApi.basePath;

  OpdsLibraryRepository(this._opdsApi);

  void init(OpdsLibrary library) {
    _library = library;
    _opdsApi.init(_library);
  }

  Future<OpdsPage> loadPage([Uri? uri]) {
    String? path;
    if (uri != null) {
      path = uri.path;
      path = uri.query.isNotEmpty ? '$path?${uri.query}' : path;
    }
    return _opdsApi.readPage(path);
  }
}