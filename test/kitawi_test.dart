import 'package:kitawi/kitawi.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    late Container awesome;

    setUp(() {
      awesome = Container();
    });

    test('Container Dimensions', () {
      expect(awesome.height, isNull);
      expect(awesome.width, isNull);
    });
  });
}
