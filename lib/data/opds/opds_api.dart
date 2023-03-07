import 'package:booksly/data/settings/models/opds_library.model.dart';

import 'models/opds_page.model.dart';

abstract class OpdsApi {
  const OpdsApi(OpdsLibrary library);

  void init(OpdsLibrary library);
  Future<OpdsPage> readPage([String? path]);
}