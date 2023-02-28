/// A class that represents a CSS dimension value. It can be a number, a percentage, or a calculation.
/// Example:
/// ```dart
/// print(Dimensions.of(100)); // "100px"
/// print(Dimensions.full); // "100%"
/// print(Dimensions.calc(from: Dimensions.of(100), inset: Dimensions.of(10))); // "calc(100px - 10px)"
/// ```
/// See also:
/// * [Size], which is used for getting the size of the window.

class Dimensions {
  final String _value;

  /// Creates a [Dimensions] object with the given [value].
  const Dimensions._(this._value);

  /// Returns a [Dimensions] object with the value "100%".
  /// Example:
  /// ```dart
  /// print(Dimensions.full); // "100%"
  /// ```
  /// See also:
  /// * [Dimensions.calc], which returns a [Dimensions] difference between two [Dimensions].
  static const Dimensions full = Dimensions._("100%");

  /// Returns a [Dimensions] object with the value "auto".
  /// Example:
  /// ```dart
  /// print(Dimensions.auto); // "auto"
  /// ```
  /// See also:
  /// * [Dimensions.zero], which returns a [Dimensions] object with the value "0".
  /// * [Dimensions.valueOf], which returns a string representation of this object.
  /// * [Dimensions.toString], which returns a string representation of this object.
  static const Dimensions auto = Dimensions._("auto");

  /// Returns a [Dimensions] object with the value "0".
  /// Example:
  /// ```dart
  /// print(Dimensions.zero); // "0"
  /// ```
  static const Dimensions zero = Dimensions._("0");

  /// Calculates the difference between two [Dimensions] objects.
  /// Example:
  /// ```dart
  /// print(Dimensions.calc(from: Dimensions.of(100), inset: Dimensions.of(10)));
  /// // "calc(100px - 10px)"
  /// ```
  /// See also:
  /// * [Dimensions.valueOf], which returns a string representation of this object.
  /// * [Dimensions.toString], which returns a string representation of this object.
  static Dimensions calc(
      {required Dimensions from,
      required Dimensions inset,
      Operator? operator = Operator.minus}) {
    switch (operator) {
      case Operator.minus:
        return Dimensions._("calc($from - $inset)");
      case Operator.plus:
        return Dimensions._("calc($from + $inset)");
      case Operator.times:
        return Dimensions._("calc($from * $inset)");
      case Operator.divide:
        return Dimensions._("calc($from / $inset)");

      default:
        return Dimensions._("calc($from - $inset)");
    }
  }

  /// Returns a [Dimensions] object with the given [value] in pixels.
  /// Example:
  /// ```dart
  /// print(Dimensions.of(100)); // "100px"
  /// ```
  /// See also:
  /// * [Dimensions.valueOf], which returns a string representation of this object.
  /// * [Dimensions.toString], which returns a string representation of this object.
  static Dimensions of(num value) => Dimensions._("${value}px");

  /// Returns a [String] representation of this [Dimensions] object.
  /// If the value is null, returns "auto".
  ///
  /// Example:
  /// ```dart
  /// Dimensions? width;
  /// print(Dimensions.valueOf(width)); // "auto" => width is null
  ///
  /// width = Dimensions.of(100);
  /// print(Dimensions.valueOf(width)); // "100px" => width is not null
  /// ```
  ///
  /// See also:
  ///
  /// * [Dimensions.toString], which returns a string representation of this object.
  static String valueOf(Dimensions? value) => value?._value ?? "auto";

  /// Returns a percentage representation of this [Dimensions] object.
  /// If the value is null, returns "100%".
  ///
  /// Example:
  /// ```dart
  /// Dimensions? width;
  /// print(Dimensions.percentageOf(width)); // "100%" => width is null
  ///
  /// width = Dimensions.of(100);
  /// print(Dimensions.percentageOf(width)); // "100%" => width is not null
  /// ```
  static Dimensions percentageOf(Object value) => Dimensions._("$value%");

  @override
  String toString() => _value;
}

enum Operator { minus, plus, times, divide }
