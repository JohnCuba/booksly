import 'package:opds_catalog/models/opds_page.model.dart';
import 'package:settings/main.dart';

abstract class OpdsApi {
  const OpdsApi(OpdsLibrary library);
  String get basePath;

  void init(OpdsLibrary library);
  Future<OpdsPage> readPage([String? path]);
}