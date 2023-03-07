import 'package:xml/xml.dart';

class OpdsLink {
  OpdsLink();
  late final String path;

  factory OpdsLink.parse(XmlElement link) {
    final linkType = link.getAttribute('type') ?? '';

    if (linkType.startsWith('image')) {
      return OpdsLinkImage(link);
    } else {
      return OpdsLinkCatalog(link);
    }
  }
}

class OpdsLinkCatalog extends OpdsLink {
  OpdsLinkCatalog(XmlElement link) {
    final href = link.getAttribute('href');
    final isUri = Uri.tryParse(href!);

    if (isUri != null) {
      path = href;
    } else {
      path = isUri!.path;
    }
  }
}

class OpdsLinkImage extends OpdsLink {
  OpdsLinkImage(XmlElement link);
}