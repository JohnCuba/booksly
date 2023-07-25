import 'package:xml/xml.dart';

String getValue(XmlNode doc, List<String> keys) {
  String value = 'unwritten';

    for (var key in keys) {
      try {
        value = doc.findAllElements(key).map((e) => e.innerText).join(', ');
      } catch (error) {
        print(error.toString());
      }
  }

  return value;
}