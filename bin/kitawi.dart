import 'dart:io';

import 'package:kitawi/kitawi.dart';

void main(List<String> arguments) async {
  final index = File('bin/index.html');
  final buffer = StringBuffer();
  buffer.write(home().render());
  await index.writeAsString(buffer.toString());
}

Element home() {
  return html(lang: "en")
    ..head = head(
      title: "Kitawi",
      links: [
        Link(
          "stylesheet",
          "https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.0.2/tailwind.min.css",
        ),
      ],
    )
    ..children = [];
}
