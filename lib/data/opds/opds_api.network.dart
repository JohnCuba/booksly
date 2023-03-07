import 'package:booksly/data/settings/models/opds_library.model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'models/opds_page.model.dart';
import 'opds_api.dart';

@Injectable(as: OpdsApi)
class OpdsApiNetwork implements OpdsApi {
  late Dio _dio;
  late String _basePath;

  @override
  init(OpdsLibrary library) {
    final Uri uri = Uri.parse(library.uri);
    _basePath = uri.path;
    _dio = Dio(BaseOptions(
      baseUrl: uri.origin,
    ));
  }

  @override
  Future<OpdsPage> readPage([String? path]) async {
    final response = await _dio.get<String>(path ?? _basePath);
    return OpdsPage(response.data!);
  }
}
