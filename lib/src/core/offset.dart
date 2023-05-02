/// A 2D floating-point offset.
///
/// An offset is a point in a 2D coordinate system, with a [dx] horizontal
/// coordinate, and a [dy] vertical coordinate.
///
/// Offsets can be added together and subtracted from each other using the `+`
/// and `-` operators, respectively.
///
/// Offsets can be negated using the unary negation `-` operator, and subtracted
/// from [Offset.zero] using the `-` operator.
///
/// The [distance] and [distanceSquared] methods compute the distance between
/// two offsets.
///
/// The [withinDistance] method compares the distance between two offsets to a

class Offset {
  final double dx;
  final double dy;

  const Offset(this.dx, this.dy);

  /// The x component of the offset.
  double get x => dx;

  /// The y component of the offset.
  double get y => dy;

  /// The negation of the offset.
  Offset operator -() => Offset(-dx, -dy);

  /// Returns the difference between two offsets.
  Offset operator -(Offset other) => Offset(dx - other.dx, dy - other.dy);

  /// Returns the sum of two offsets.
  Offset operator +(Offset other) => Offset(dx + other.dx, dy + other.dy);

  /// Scales the offset in each dimension by the given factor.
  Offset operator *(double operand) => Offset(dx * operand, dy * operand);

  @override
  String toString() => 'Offset($dx, $dy)';
}

var t = Offset(3, 4);
