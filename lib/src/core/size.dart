import 'dart:html';

/// The [Size] class is used to get the size of the window.

class Size {
  late int _x;
  late int _y;

  /// [Size] factory
  static final Size _instance = Size._internal();

  /// [Size] accessor
  factory Size() {
    return _instance;
  }

  /// [Size] constructor
  Size._internal() {
    _x = 0;
    _y = 0;
  }

  /// The width of the window.
  double get width => _x.toDouble();

  /// The height of the window.
  double get height => _y.toDouble();

  set x(int value) {
    _x = value;
  }

  set y(int value) {
    _y = value;
  }

  /// Updates the size of the window.
  void updateSize() {
    _x = window.innerWidth ?? 0;
    _y = window.innerHeight ?? 0;
  }

  @override
  String toString() {
    return 'Size(x: $_x, y: $_y)';
  }
}
