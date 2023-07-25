import 'package:test/test.dart';
import 'package:booksly/config/consts.dart';

void main() {
  group('SupportedExtensions', () {
    test('Should have at least one extension', () {
      const extensions = SupportedExtensions.values;

      expect(extensions.length, (int value) => value > 1);
    });
  });
}