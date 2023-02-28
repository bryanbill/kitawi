import 'package:kitawi/kitawi.dart';
import 'package:test/test.dart';

void main() {
  group('Tests whether the widgets are laid out properly on the DOM', () {
    setUp(() {});

    test('tests for Container', () {
      var container = Container(
        width: Dimensions.of(200),
        height: Dimensions.of(200),
        child: Text('Hello World'),
      );
      expect(container.height.toString(), "200px");
      expect(container.width.toString(), "200px");
      expect(container.child?.render(), isNull);
    });
  });
}
