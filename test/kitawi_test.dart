import 'package:kitawi/widgets.dart';
import 'package:test/test.dart';

void main() {
  group('Tests whether the widgets are laid out properly on the DOM', () {
    setUp(() {});

    test('tests for Container', () {
      var container = Container(
        width: 200.px,
        height: 200.px,
        child: Text('Hello World'),
      );
      expect(container.height.toString(), "200px");
      expect(container.width.toString(), "200px");
      expect(container.child?.createElement(), isNull);
    });
  });
}
