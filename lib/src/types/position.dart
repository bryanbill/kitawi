class Position {
  final String _value;

  /// Creates a [Position] object with the given [value].
  const Position._(this._value);

  /// Returns a [Position] object with the value "absolute".
  /// Example:
  /// ```dart
  /// print(Position.absolute); // "absolute"
  /// ```
  /// See also:
  /// * [Position.relative], which returns a [Position] object with the value "relative".
  /// * [Position.valueOf], which returns a string representation of this object.
  /// * [Position.toString], which returns a string representation of this object.
  static const Position absolute = Position._("absolute");

  /// Returns a [Position] object with the value "relative".
  /// Example:
  /// ```dart
  /// print(Position.relative); // "relative"
  /// ```
  /// See also:
  /// * [Position.absolute], which returns a [Position] object with the value "absolute".
  /// * [Position.valueOf], which returns a string representation of this object.
  /// * [Position.toString], which returns a string representation of this object.
  static const Position relative = Position._("relative");

  /// Returns a [Position] object with the value "fixed".
  /// Example:
  /// ```dart
  /// print(Position.fixed); // "fixed"
  /// ```
  /// See also:
  /// * [Position.absolute], which returns a [Position] object with the value "absolute".
  /// * [Position.relative], which returns a [Position] object with the value "relative".
  /// * [Position.valueOf], which returns a string representation of this object.
  /// * [Position.toString], which returns a string representation of this object.
  /// * [Position.sticky], which returns a [Position] object with the value "sticky".
  /// * [Position.valueOf], which returns a string representation of this object.
  static const Position fixed = Position._("fixed");

  /// Returns a [Position] object with the value "sticky".
  /// Example:
  /// ```dart
  /// print(Position.sticky); // "sticky"
  /// ```
  ///
  /// See also:
  /// * [Position.absolute], which returns a [Position] object with the value "absolute".
  /// * [Position.relative], which returns a [Position] object with the value "relative".
  /// * [Position.valueOf], which returns a string representation of this object.
  /// * [Position.toString], which returns a string representation of this object.
  /// * [Position.fixed], which returns a [Position] object with the value "fixed".
  static const Position sticky = Position._("sticky");

  /// Returns a [Position] object with the value "static".
  /// Example:
  /// ```dart
  /// print(Position.static); // "static"
  /// ```
  ///
  /// See also:
  /// * [Position.absolute], which returns a [Position] object with the value "absolute".
  /// * [Position.relative], which returns a [Position] object with the value "relative".
  /// * [Position.valueOf], which returns a string representation of this object.
  /// * [Position.toString], which returns a string representation of this object.
  /// * [Position.fixed], which returns a [Position] object with the value "fixed".
  static const Position static = Position._("static");

  /// Returns a [String] representation of this [Position] object.
  /// If the value is null, returns "relative".
  ///
  /// Example:
  /// ```dart
  /// print(Position.relative.valueOf()); // "relative"
  /// ```
  /// See also:
  /// * [Position.toString], which returns a string representation of this object.
  /// * [Position.absolute], which returns a [Position] object with the value "absolute".
  /// * [Position.relative], which returns a [Position] object with the value "relative".
  /// * [Position.valueOf], which returns a string representation of this object.
  String valueOf() => _value;

  /// Returns a [String] representation of this [Position] object.
  /// If the value is null, returns "relative".
  /// Example:
  /// ```dart
  /// print(Position.relative); // "relative"
  /// ```
  /// See also:
  /// * [Position.valueOf], which returns a string representation of this object.
  /// * [Position.absolute], which returns a [Position] object with the value "absolute".
  /// * [Position.relative], which returns a [Position] object with the value "relative".
  @override
  String toString() => _value;
}
