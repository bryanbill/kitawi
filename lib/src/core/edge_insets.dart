import 'package:kitawi/widgets.dart';

/// A set of offsets in each of the cardinal directions.
///
/// Used to represent padding or margin.

class EdgeInsets {
  /// [EdgeInsets] with [value] offsets in all direction.
  const EdgeInsets.all(Dimensions value)
      : left = value,
        top = value,
        right = value,
        bottom = value;

  /// [EdgeInsets] with value offset only on the specified side.
  const EdgeInsets.only({this.left, this.top, this.right, this.bottom});

  /// [EdgeInsets] with [value] offset on the left and right `horizontal`, and value offset
  /// on the top and bottom `vertical`.
  const EdgeInsets.symmetric({Dimensions? vertical, Dimensions? horizontal})
      : left = horizontal ?? Dimensions.zero,
        top = vertical ?? Dimensions.zero,
        right = horizontal ?? Dimensions.zero,
        bottom = vertical ?? Dimensions.zero;

  /// [EdgeInsets] with value offset on from left -> top -> right -> bottom.
  const EdgeInsets.fromLTRB(this.left, this.top, this.right, this.bottom);

  static EdgeInsets get zero => EdgeInsets.all(Dimensions.zero);

  final Dimensions? left;
  final Dimensions? top;
  final Dimensions? right;
  final Dimensions? bottom;

  @override
  String toString() {
    return '${top}_${right}_${bottom}_$left';
  }
}
