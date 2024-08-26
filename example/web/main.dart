import 'package:kitawi/kitawi.dart';

void main() {
  final app = App(
    children: [
      MyApp(),
    ],
    style: {},
  );
  app.run();
}

class MyApp extends Template {
  MyApp()
      : super(
          tag: 'div',
          style: {
            'display': 'flex',
            'justify-content': 'center',
            'align-items': 'center',
            'height': '100vh',
            'width': '100vw',
          },
        );

  int counter = 0;

  @override
  Component build(context) {
    return Div(
      style: {
        'display': 'flex',
        'flex-direction': 'column',
        'align-items': 'center',
      },
      children: [
        Span(
          style: {
            'font-size': '1rem',
            'margin-bottom': '1rem',
          },
          text: "Counter: $counter",
        ),
        Button(
          style: {
            'padding': '0.5rem 1rem',
            'font-size': '1rem',
            'cursor': 'pointer',
          },
          onClick: (event) {
            counter++;
            context.remove();
          },
          children: [
            Span(
              text: 'Increment',
            ),
          ],
        ),
      ],
    );
  }

  @override
  void onRender() {
    window.alert('Rendered');
  }

  @override
  void onDispose() {
    window.alert('Disposed');
  }
}
