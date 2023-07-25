import 'package:xml/xml.dart';

import 'opds_entry.model.dart';

class OpdsPage {
  late XmlDocument _xmlDocument;
  late String title;
  late List<OpdsEntry> entries;

  OpdsPage(String responseData) {
    _xmlDocument = XmlDocument.parse(responseData);
    title = _xmlDocument.findAllElements('title').first.innerText;
    entries = _xmlDocument.findAllElements('entry').map((entry) => OpdsEntry(entry)).toList();
  }
}