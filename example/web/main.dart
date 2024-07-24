import 'package:kitawi/kitawi.dart';

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
            style: {
              'font-size': '2rem',
            },
          ),
        ],
      ),
    ],
  );

  app.run();
}
