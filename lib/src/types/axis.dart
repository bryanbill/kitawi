class Axis {
  const Axis._(this._value);
  final int _value;
  static const Axis horizontal = Axis._(0);
  static const Axis vertical = Axis._(1);

  @override
  String toString() {
    switch (this) {
      case Axis.horizontal:
        return 'horizontal';
      case Axis.vertical:
        return 'vertical';
      default:
        return _value.toString();
    }
  }
}
