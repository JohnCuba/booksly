import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:xml/xml.dart';

part 'opds_library.model.g.dart';

@HiveType(typeId: 2)
class OpdsLibrary extends HiveObject {
  @HiveField(0, defaultValue: '')
  String uri;
  
  @HiveField(1, defaultValue: '')
  String title;

  OpdsLibrary({required this.uri, required this.title});

  static Future<OpdsLibrary> parseUri(String uri) async {
    final response = await Dio().get(uri);
    final rootXml = XmlDocument.parse(response.data.toString());

    return OpdsLibrary(
      uri: uri,
      title: rootXml.findAllElements('title').first.text
    );
  }
}