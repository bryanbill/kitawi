import 'dart:html' as html;
import 'dart:math';

import 'package:kitawi/src/core/key.dart';
import 'package:kitawi/src/mixins/resize.dart';

abstract class Widget with Resize {
  Key? key;
  html.Element? _element;

  Widget({Key? key});

  html.Element render() {
    //  generate key if not provided
    key ??= Key(Random().nextInt(1000000000).toString());
    _element ??= createElement()..id = key?.value ?? 'this is not right';
    return _element!;
  }

  html.Element createElement();

  // rebuild
  void rebuild() {
    createElement();
  }

  @override
  void dispose() {
    super.dispose();
    _element?.remove();
    _element = null;
  }
}
