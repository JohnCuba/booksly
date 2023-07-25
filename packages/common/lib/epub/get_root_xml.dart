import 'dart:io';
import 'package:archive/archive.dart';
import 'package:xml/xml.dart';

import 'package:common/archive/main.dart';

const String _metaFileName = 'META-INF/container.xml';
const String _rootFileTag = 'rootfile';
const String _rootFilepathAttribute = 'full-path';

Future<XmlDocument> getRootXml(File file) async {
  final fileBytes = await file.readAsBytes();
  final archive = ZipDecoder().decodeBytes(fileBytes);
  final metafile = findXml(archive, _metaFileName);

  final rootFileName = metafile
      .findAllElements(_rootFileTag)
      .first
      .getAttribute(_rootFilepathAttribute);
  if (rootFileName == null) {
    throw Exception('Can\'t find file meta data');
  }

  return findXml(archive, rootFileName);
}
