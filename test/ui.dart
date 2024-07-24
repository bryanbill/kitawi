import 'package:kitawi/kitawi.dart';
import 'package:kitawi/src/utils/find.dart';
import 'package:test/test.dart';

class CustomComponent extends Component {
  CustomComponent({super.tag = "custom"});
}

void main() {
  group('UI components test:', () {
    test('Create a custom component', () {
      final custom = CustomComponent();
      custom.render();

      expect(custom.element?.tagName, "CUSTOM");
    });

    test('Create a div element', () {
      final div = Div();
      div.render();

      expect(div.element?.tagName, "DIV");
    });

    test("Event listener test", () {
      String? text;
      final button = Div(
          onClick: (event) {
            text = "Clicked";
          },
          children: [P("Click me", id: "click-me")]);
      button.render();

      // simulate a click event
      button.element?.dispatchEvent(MouseEvent('click'));

      expect(text, "Clicked");
    });
  });
}
