/// A set of offsets in each of the cardinal directions.
///
/// Used to represent padding or margin.

class EdgeInsets {
  const EdgeInsets.all(double value)
      : left = value,
        top = value,
        right = value,
        bottom = value;

  const EdgeInsets.only(
      {this.left = 0.0, this.top = 0.0, this.right = 0.0, this.bottom = 0.0});

  const EdgeInsets.symmetric({double vertical = 0.0, double horizontal = 0.0})
      : left = horizontal,
        top = vertical,
        right = horizontal,
        bottom = vertical;

  const EdgeInsets.fromLTRB(this.left, this.top, this.right, this.bottom);

  final double left;
  final double top;
  final double right;
  final double bottom;

  @override
  String toString() {
    return '$top $right $bottom $left';
  }
}
