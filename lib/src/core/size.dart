import 'dart:html';

/// The [Size] class is used to get the size of the window.

class Size {
  late int _x;
  late int _y;

  static final Size _instance = Size._internal();

  factory Size() {
    return _instance;
  }

  Size._internal() {
    _x = 0;
    _y = 0;
  }

  double get width => _x.toDouble();
  double get height => _y.toDouble();

  set x(int value) {
    _x = value;
  }

  set y(int value) {
    _y = value;
  }

  void updateSize() {
    _x = window.innerWidth ?? 0;
    _y = window.innerHeight ?? 0;
  }

  @override
  String toString() {
    return 'Size(x: $_x, y: $_y)';
  }
}
