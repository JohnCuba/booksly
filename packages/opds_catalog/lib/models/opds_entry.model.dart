import 'package:xml/xml.dart';
import 'package:common/xml/main.dart' as xml_common;

import 'opds_link.model.dart';

const pagePathType = 'application/atom+xml';

class OpdsEntry {
  final XmlElement _xmlElement;
  late String title;
  late String content;
  late List<OpdsLink> links;

  OpdsEntry(this._xmlElement) {
    title = xml_common.getValue(_xmlElement, ['title']);
    content = xml_common.getValue(_xmlElement, ['content']);
    links = _xmlElement.findAllElements('link').map((link) => OpdsLink.parse(link)).toList();
  }
}