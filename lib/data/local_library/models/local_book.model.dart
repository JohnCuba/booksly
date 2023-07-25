import 'dart:io';

import 'package:booksly/config/consts.dart';
import 'package:booksly/data/lib/utils/get_root_xml_doc_from_epub.utils.dart';
import 'package:booksly/data/lib/utils/get_value_from_xml.util.dart';

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
    final rootFile = await getRootXmlDocFromEpub(file);

    return LocalBook(
        file: file,
        title: getValueFromXml(rootFile, ['dc:title']),
        author: getValueFromXml(rootFile, ['dc:creator']),
        description: getValueFromXml(rootFile, ['dc:description', 'dc:subject']));
  }
}
