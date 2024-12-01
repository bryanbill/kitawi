import 'package:kitawi/kitawi.dart';

Future<void> run({
  String target = "#app",
  required Navigator navigator,
  bool debug = false,
}) async {
  if (debug) {
    kDEBUG = debug;
  }

  navigator.init(target);
}
