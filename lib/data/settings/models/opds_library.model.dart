import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:translit/translit.dart';
import 'package:xml/xml.dart';

part 'opds_library.model.g.dart';

/// Model of opds library which store in hive local db
@HiveType(typeId: 2)
class OpdsLibrary extends HiveObject {
  /// Uri of library 
  @HiveField(0, defaultValue: '')
  String uri;
  
  /// Title of library
  @HiveField(1, defaultValue: '')
  String title;

  /// Uniq slug of entity like id 
  @HiveField(3, defaultValue: '')
  String slug;

  OpdsLibrary({required this.uri, required this.title, required this.slug});

  /// Async factory to create library from uri
  /// 
  /// Makes request to passed uri and take meta info about library,
  /// returns instance of OpdsLibrary
  static Future<OpdsLibrary> parseUri(String uri) async {
    final response = await Dio().get(uri);
    final rootXml = XmlDocument.parse(response.data.toString());
    final title = rootXml.findAllElements('title').first.innerText;
    final slug = Translit().toTranslit(source: title.toLowerCase().replaceAll(' ', '_'));

    return OpdsLibrary(
      uri: uri,
      title: title,
      slug: slug,
    );
  }
}