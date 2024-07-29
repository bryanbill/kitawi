import 'package:kitawi/kitawi.dart';
import 'package:test/test.dart';

class CustomComponent extends Component {
  CustomComponent({super.tag = "custom"});
}

void main() {
  group('UI components test:', () {
    setUpAll(() {
      document.body!.appendChild(Div(id: "app").render());
    });
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

    test("Component attached to DOM", () {
      document.body!.appendChild(Div(id: "app").render());
      final app = App(target: "#app", children: []);
      app.run();

      expect(document.title, "Kitawi");
    });

    test("Media Controller is attached to media player", () {
      final video = Video(src: "https://www.w3schools.com/html/mov_bbb.mp4");
      video.render();

      expect(video.element?.tagName, "VIDEO");

      final controller = MediaController.of(video);
      expect(controller?.media, isNotNull);
    });
  });
}
