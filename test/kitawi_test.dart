import 'package:kitawi/kitawi.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final awesome = Container();

    setUp(() {
      // Additional setup goes here.
    });

    test('Container Dimensions', () {
      expect(awesome.height, isNull);
      expect(awesome.width, isNull);
    });
  });
}
