import 'package:kitawi/kitawi.dart';

void main() {
  start(() {
    run(Container(
      height: Size().height,
      width: Size().width,
      constraints: BoxConstraints(),
      decoration:
          Decoration(color: Colors.red, border: Border(color: Colors.red)),
    ));
  });
}
