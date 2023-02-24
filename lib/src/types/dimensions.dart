class Dimensions {
  final String _value;

  const Dimensions._(this._value);

  static const Dimensions full = Dimensions._("100%");

  static const Dimensions auto = Dimensions._("auto");

  static const Dimensions zero = Dimensions._("0");

  static Dimensions of(int value) => Dimensions._("${value}px");

  static String valueOf(Dimensions? value) => value?._value ?? "auto";

  @override
  String toString() => _value;
}
