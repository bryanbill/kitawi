import 'package:kitawi/ui.dart';
import 'package:kitawi/tailwind.dart';

void main() {
  Tailwind.init();

  App(
    children: [
      Component(
        style: "width: 100px; height: 100px;",
        tailwind: Tailwind()
            .bg(
              Color.red[500],
            )
            .rounded(
              100.px,
            ),
      ),
    ],
  ).render();
}
