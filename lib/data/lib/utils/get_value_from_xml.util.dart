import 'package:easy_localization/easy_localization.dart';
import 'package:xml/xml.dart';

String getValueFromXml(XmlDocument doc, List<String> keys) {
  final fallback = tr('common.unwrited');
  String value = fallback;

    for (var key in keys) {
      try {
        value = doc.findAllElements(key).map((e) => e.text).join(', ');
      } catch (error) {
        print(error.toString());
      }
  }
  return value;
}