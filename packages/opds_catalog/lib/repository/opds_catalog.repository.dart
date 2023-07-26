import 'package:injectable/injectable.dart';
import 'package:opds_catalog/main.dart';
import 'package:opds_catalog/services/opds_api.dart';
import 'package:settings/main.dart';

@injectable
class OpdsCatalogRepository {
  final OpdsApi _opdsApi;
  late final OpdsLibrary _library;
  String get libraryTitle  => _library.title;
  String get libraryBasePath => _opdsApi.basePath;

  OpdsCatalogRepository(this._opdsApi);

  void init(OpdsLibrary library) {
    _library = library;
    _opdsApi.init(_library);
  }

  Future<OpdsPage> loadPage([Uri? uri]) {
    String? path;
    if (uri != null) {
      path = uri.query.isNotEmpty ? '$path?${uri.query}' : uri.path;
    }
    return _opdsApi.readPage(path);
  }
}