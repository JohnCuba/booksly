import 'package:booksly/config/consts.dart';
import 'package:xml/xml.dart';
import 'dart:developer' as developer;

class OpdsLink {
  late final Uri uri;
  bool hasError = false;
  OpdsLink();

  factory OpdsLink.parse(XmlElement link) {
    try {
      final linkTypeAttribute = link.getAttribute('type');
      if (linkTypeAttribute == null) throw Error();

      final linkType = linkTypeAttribute.split('/')[0];

      switch(linkType) {
        case 'image': return OpdsLinkImage(link);
        case 'application': {
          if (linkTypeAttribute.contains('atom+xml')) {
            return OpdsLinkCatalog(link);
          }
          return OpdsLinkDownload(link);
        }
        default: throw Error();
      }
    } catch (_) {
      developer.log('[OpdsLink]: Can\'t parse link element $link', name: 'ERROR');
      return OpdsLink.withError();
    }
  }

  factory OpdsLink.withError() {
    final instance = OpdsLink();
    instance.hasError = true;

    return instance;
  }

  _resolvePath(XmlElement link) {
    final href = link.getAttribute('href');
    if (href == null) throw Error();
    uri = Uri.parse(href);
  }
}

class OpdsLinkCatalog extends OpdsLink {
  OpdsLinkCatalog(XmlElement link) {
    _resolvePath(link);
  }
}

class OpdsLinkDownload extends OpdsLink {
  late final SupportedExtensions extension;
  late final String? unSupportedExtension;
  OpdsLinkDownload(XmlElement link) {
    _resolvePath(link);
    _resolveExtension(link);
  }

  _resolveExtension(XmlElement link) {
    final type = link.getAttribute('type');
    if (type == null) throw Error();
    try {
      extension = SupportedExtensions.values.firstWhere(
        (supportedExtension) => type.contains('application/${supportedExtension.name}')
      );
    } catch (_) {
      unSupportedExtension = type.replaceFirst('application/', '');
    }
  }
}

class OpdsLinkImage extends OpdsLink {
  OpdsLinkImage(XmlElement link);
}