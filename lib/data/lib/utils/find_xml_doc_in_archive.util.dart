import 'package:archive/archive.dart';
import 'package:xml/xml.dart';
import 'dart:convert' as convert;

XmlDocument findXmlDocInArchive(Archive archive, String name) {
  final metafile = archive.findFile(name);
  final text = convert.utf8.decode(metafile!.content);
  return XmlDocument.parse(text);
}
