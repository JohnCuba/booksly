import 'package:xml/xml.dart';

import 'opds_entry.model.dart';

class OpdsPage {
  late XmlDocument _xmlDocument;
  late List<OpdsEntry> entries;

  OpdsPage(String responseData) {
    _xmlDocument = XmlDocument.parse(responseData);
    entries = _xmlDocument.findAllElements('entry').map((entry) => OpdsEntry(entry)).toList();
  }
}