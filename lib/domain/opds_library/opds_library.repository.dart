import 'package:booksly/data/opds/models/opds_page.model.dart';
import 'package:booksly/data/opds/opds_api.dart';
import 'package:booksly/data/settings/models/opds_library.model.dart';
import 'package:injectable/injectable.dart';

@injectable
class OpdsLibraryRepository {
  final OpdsApi _opdsApi;
  late final OpdsLibrary _library;

  OpdsLibraryRepository(this._opdsApi);

  init(OpdsLibrary library) {
    _library = library;
    _opdsApi.init(_library);
  }

  Future<OpdsPage> loadPage([String? path]) {
    return _opdsApi.readPage(path);
  }
}