import 'package:kitawi/kitawi.dart';
import 'package:kitawi/utils.dart';

void main() {
  final app = App(
      title: 'Kitawi',
      children: [
        Div(
          style: {
            'display': 'flex',
            "flex-direction": 'column',
            'justify-content': 'center',
            'align-items': 'center',
            'height': '100vh',
          },
          children: [
            P(
              'Welcome to Kitawi!',
              id: "welcome",
              style: {
                'font-size': '2rem',
              },
            ),
            Input(
              type: InputType.password,
              children: [
                Button(
                  children: [P('Click me')],
                ),
              ],
            ),
            Select(
              onSelect: (p0) => print(p0),
              options: [
                Option(
                  value: '1',
                  child: P('One'),
                ),
                Option(
                  value: '2',
                  child: P('Two'),
                ),
              ],
            ),
            Checkbox(
              onChanged: (value) => print(value),
            ),
            Radio(
              onChanged: (value) => print(value),
            ),
            Radio(
              onChanged: (value) => print(value),
            ),
          ],
        ),
      ],
      onRender: (doc) {
        final textController = InputController.of(find("input"));
        textController.onTextChange((text) {
          print(text);
        });
      });

  app.run();
}
