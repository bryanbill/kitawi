import 'package:kitawi/kitawi.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final awesome = Div();

    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      expect(awesome.render(), isTrue);
    });
  });
}
