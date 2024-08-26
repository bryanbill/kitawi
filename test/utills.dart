import 'package:kitawi/kitawi.dart';
import 'package:kitawi/utils.dart';
import 'package:test/test.dart';

void main() {
  group('Utils:', () {
    setUpAll(() {
      document.body!.appendChild(Div(id: "app").render());
    });

    test("find a component in stack", () {
      final app = App(children: [Input()]);
      app.run();
      final input = find("input");
      expect(input, isNotNull);
    });

    test("find a component in stack by id", () {
      final app = App(children: [Input(id: "input")]);
      app.run();
      final input = find("#input");
      expect(input, isNotNull);
    });

    test("find a component in stack by class", () {
      document.body!.appendChild(Div(id: "app").render());
      final app = App(children: [Input(className: "input")]);
      app.run();
      final input = find(".input");
      expect(input, isNotNull);
    });

    test("set query string", () {
      Query.set({
        'name': 'John Doe',
      });

      expect(Query.get('name'), 'John Doe');
    });

    test("remove query string", () {
      Query.remove('name');

      expect(Query.get('name'), isNull);
    });

    test("clear query string", () {
      Query.set({
        'name': 'John Doe',
      });

      Query.clear();

      expect(Query.getAll(), {});
    });
  });
}
