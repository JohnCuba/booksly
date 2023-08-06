import 'dart:io';
import 'dart:convert' as convert;
import 'package:archive/archive.dart';
import 'package:xml/xml.dart';

getRootXml(File file) async {
  try {
    final string = await file.readAsString();
    return XmlDocument.parse(string);
  } catch(id) {
    final fileBytes = await file.readAsBytes();
    final archive = ZipDecoder().decodeBytes(fileBytes);
    return XmlDocument.parse(convert.utf8.decode(archive.first.content));
  }
}