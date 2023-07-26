import 'dart:io';

import 'package:common/config/supported_extensions.dart';
import 'package:common/epub/main.dart' as epub_common;
import 'package:common/xml/main.dart' as xml_common;

final RegExp _fileExtension = RegExp(r'(?=.)[0-9a-z]+$');

class LocalBook {
  final File file;
  final String title;
  final String author;
  final String description;

  LocalBook({
    required this.file,
    required this.title,
    required this.author,
    required this.description,
  });

  static Future<LocalBook> parseFile(String path) {
    final extension = _fileExtension.stringMatch(path);

    if (extension == SupportedExtensions.epub.name) {
      return _parseEpub(path);
    } else if (extension == SupportedExtensions.fb2.name) {
      // TODO: Add fb2 parser
      return Future(() => LocalBook(file: File(path), title: 'title', author: 'author', description: 'description'));
    } else {
      throw Exception('Unsuported file');
    }
  }

  static Future<LocalBook> _parseEpub(String path) async {
    final file = File(path);
    final rootFile = await epub_common.getRootXml(file);

    return LocalBook(
        file: file,
        title: xml_common.getValue(rootFile, ['dc:title']),
        author: xml_common.getValue(rootFile, ['dc:creator']),
        description: xml_common.getValue(rootFile, ['dc:description', 'dc:subject']));
  }
}
