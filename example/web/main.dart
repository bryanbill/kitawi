import 'package:kitawi/kitawi.dart';
import 'package:kitawi/utils.dart';

void main() {
  final app = App(
      title: 'Kitawi',
      children: [
        Div(
          style: {
            'display': 'flex',
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
          ],
        ),
      ],
      onRender: (doc) {
        find("#welcome").addClass("text-primary");
      });

  app.run();
}
