import 'package:kitawi/src/core/color.dart';

/// The Decoration class is used to decorate a widget
/// with a color, border, and box shadow e.t.c

class Decoration {
  final Color? color;
  final Border? border;
  final List<BoxShadow>? boxShadow;

  Decoration({
    this.color,
    this.border,
    this.boxShadow,
  });
}

/// The border type can be solid, dashed, dotted, double, groove, ridge, inset, or outset
/// The border radius is the radius of the border
enum BorderType { solid, dashed, dotted, double, groove, ridge, inset, outset }

/// The Border class is used to add a border to a widget
/// It has a width, color [Color], type [BorderType], and border radius
class Border {
  final double? width;
  final Color? color;
  final BorderType? type;
  final double? borderRadius;

  Border({
    this.width,
    this.color,
    this.type,
    this.borderRadius,
  });

  @override
  String toString() {
    return '${width ?? 0}px ${type?.name.split(".").last ?? BorderType.solid.name.split(".").last} ${color?.rgba ?? 'inherit'}';
  }
}

/// The BoxShadow class is used to add a box shadow to a widget
/// It has a color [Color], offset x, offset y, blur radius, and spread radius
/// The offset x and offset y are the distance of the shadow from the widget
/// The blur radius is the blur of the shadow
/// The spread radius is the spread of the shadow
/// The color is the color of the shadow
class BoxShadow {
  final Color color;
  final double offsetX;
  final double offsetY;
  final double blurRadius;
  final double spreadRadius;

  BoxShadow({
    required this.color,
    required this.offsetX,
    required this.offsetY,
    required this.blurRadius,
    required this.spreadRadius,
  });

  @override
  String toString() {
    return '${offsetX}px ${offsetY}px ${blurRadius}px ${spreadRadius}px ${color.rgba}';
  }
}

/// Alignment is used to align a widget in a container
/// It has an x and y alignment
/// The x alignment can be:
///
/// - topLeft
/// - topCenter
/// - topRight
/// - centerLeft
/// - center
/// - centerRight
/// - bottomLeft
/// - bottomCenter
/// - bottomRight
class Alignment {
  final String x;
  final String y;

  const Alignment(this.x, this.y);
  static const Alignment topCenter = Alignment('center', 'flex-start');
  static const Alignment topRight = Alignment('flex-end', 'flex-start');
  static const Alignment topLeft = Alignment('flex-start', 'flex-start');

  static const Alignment center = Alignment('center', 'center');
  static const Alignment centerRight = Alignment('flex-end', 'center');
  static const Alignment centerLeft = Alignment('flex-start', 'center');

  static const Alignment bottomCenter = Alignment('center', 'flex-end');
  static const Alignment bottomRight = Alignment('flex-end', 'flex-end');
  static const Alignment bottomLeft = Alignment('flex-start', 'flex-end');
}

/// The [MainAxisAlignment] class is used to align the children of a [Row] or [Column] widget
/// It has the following values:
/// - start
/// - end
/// - center
/// - spaceBetween
/// - spaceAround
/// - spaceEvenly
///
/// In a [Row] widget, the start value aligns the children to the left
/// In a [Column] widget, the start value aligns the children to the top
class MainAxisAlignment {
  final String _value;

  const MainAxisAlignment._(this._value);

  static const MainAxisAlignment start = MainAxisAlignment._('flex-start');
  static const MainAxisAlignment end = MainAxisAlignment._('flex-end');
  static const MainAxisAlignment center = MainAxisAlignment._('center');
  static const MainAxisAlignment spaceBetween =
      MainAxisAlignment._('space-between');
  static const MainAxisAlignment spaceAround =
      MainAxisAlignment._('space-around');
  static const MainAxisAlignment spaceEvenly =
      MainAxisAlignment._('space-evenly');

  @override
  String toString() => _value;
}

/// The [CrossAxisAlignment] class is used to align the children of a [Row] or [Column] widget
/// It has the following values:
/// - start
/// - end
/// - center
/// - stretch
/// - baseline
///
/// In a [Row] widget, the start value aligns the children to the top
/// In a [Column] widget, the start value aligns the children to the left

class CrossAxisAlignment {
  final String _value;

  const CrossAxisAlignment._(this._value);

  static const CrossAxisAlignment start = CrossAxisAlignment._('flex-start');
  static const CrossAxisAlignment end = CrossAxisAlignment._('flex-end');
  static const CrossAxisAlignment center = CrossAxisAlignment._('center');
  static const CrossAxisAlignment stretch = CrossAxisAlignment._('stretch');
  static const CrossAxisAlignment baseline = CrossAxisAlignment._('baseline');

  @override
  String toString() => _value;
}

/// The [BoxFit] class is used to fit a widget in a container
/// It has the following values:
/// - fill : The fill value stretches the widget to fill the container
/// - contain : The contain value fits the widget in the container without stretching
/// - cover : The cover value stretches the widget to fill the container
/// - fitWidth : The fitWidth value fits the widget in the container without stretching
/// - fitHeight : The fitHeight value fits the widget in the container without stretching
/// - none : The none value does not fit the widget in the container
/// - scaleDown : The scaleDown value fits the widget in the container without stretching

class BoxFit {
  final String _value;

  const BoxFit._(this._value);

  static const BoxFit fill = BoxFit._('fill');
  static const BoxFit contain = BoxFit._('contain');
  static const BoxFit cover = BoxFit._('cover');
  static const BoxFit fitWidth = BoxFit._('fit-width');
  static const BoxFit fitHeight = BoxFit._('fit-height');
  static const BoxFit none = BoxFit._('none');
  static const BoxFit scaleDown = BoxFit._('scale-down');

  @override
  String toString() => _value;
}

/// The [BoxConstraints] class is used to set the constraints of a widget
/// It has a minimum width, maximum width, minimum height, and maximum height

class BoxConstraints {
  final double? minWidth;
  final double? maxWidth;
  final double? minHeight;
  final double? maxHeight;

  BoxConstraints({
    this.minWidth,
    this.maxWidth,
    this.minHeight,
    this.maxHeight,
  });

  @override
  String toString() {
    return 'min-width: ${minWidth ?? 0}px; max-width: ${maxWidth ?? double.infinity}px; min-height: ${minHeight ?? 0}px; max-height: ${maxHeight ?? double.infinity}px;';
  }
}
