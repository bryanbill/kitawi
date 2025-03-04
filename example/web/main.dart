import 'package:kitawi/kitawi.dart';

void main() {
  run(
    target: '#add',
    navigator: Navigator(
      routes: {
        '/': Route(
          component:(c)=> Span(
            text: "Home",
            onClick: (p0) => navigator.push('/about'),
          ),
        ),
        '/about': Route(
          component:(c)=> Span(
            text: "About",
            onClick: (p0) => navigator.push('/'),
          ),
        ),
      },
    ),
  );
}
