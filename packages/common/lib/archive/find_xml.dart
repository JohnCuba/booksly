import 'dart:convert' as convert;
import 'package:archive/archive.dart';
import 'package:xml/xml.dart';

XmlDocument findXml(Archive archive, String name) {
  final metaFile = archive.findFile(name);
  final text = convert.utf8.decode(metaFile!.content);

  return XmlDocument.parse(text);
}
