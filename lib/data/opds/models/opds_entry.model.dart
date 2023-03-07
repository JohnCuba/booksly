import 'package:booksly/data/lib/utils/get_value_from_xml.util.dart';
import 'package:xml/xml.dart';

import 'opds_link.model.dart';

const pagePathType = 'application/atom+xml';

class OpdsEntry {
  final XmlElement _xmlElement;
  late String title;
  late String content;
  late List<OpdsLink> links;

  OpdsEntry(this._xmlElement) {
    title = getValueFromXml(_xmlElement, ['title']);
    content = getValueFromXml(_xmlElement, ['content']);
    links = _xmlElement.findAllElements('link').map((link) => OpdsLink.parse(link)).toList();
  }
}