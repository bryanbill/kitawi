/// A set of offsets in each of the cardinal directions.
///
/// Used to represent padding or margin.

class EdgeInsets {
  /// [EdgeInsets] with [value] offsets in all direction.
  const EdgeInsets.all(double value)
      : left = value,
        top = value,
        right = value,
        bottom = value;

  /// [EdgeInsets] with value offset only on the specified side.
  const EdgeInsets.only(
      {this.left = 0.0, this.top = 0.0, this.right = 0.0, this.bottom = 0.0});

  /// [EdgeInsets] with [value] offset on the left and right `horizontal`, and value offset
  /// on the top and bottom `vertical`.
  const EdgeInsets.symmetric({double vertical = 0.0, double horizontal = 0.0})
      : left = horizontal,
        top = vertical,
        right = horizontal,
        bottom = vertical;

  /// [EdgeInsets] with value offset on from left -> top -> right -> bottom.
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
