import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:opds_catalog/models/opds_page.model.dart';
import 'opds_api.dart';

@Injectable(as: OpdsApi)
class OpdsApiNetwork implements OpdsApi {
  late Dio _dio;
  late String _basePath;
  @override
  String get basePath => _basePath;

  @override
  init(library) {
    final Uri uri = Uri.parse(library.uri);
    _basePath = uri.path;
    _dio = Dio(BaseOptions(
      baseUrl: uri.origin,
    ));
  }

  @override
  readPage([path]) async {
    final response = await _dio.get<String>(path ?? _basePath);
    return OpdsPage(response.data!);
  }
}
