library foundation;

import 'package:kitawi/src/core/color.dart';
import 'package:kitawi/src/core/dimensions.dart';


/// The Decoration class is used to decorate a widget
/// with a color, border, and box shadow e.t.c

class Decoration {
  final Color? color;
  final Border? border;
  final List<BoxShadow>? boxShadow;
  final DecorationImage? image;

  final Gradient? gradient;

  /// The [BorderRadius] `borderRadius` parameter is optional and
  /// specifies the border radius of the widget.
  final BorderRadius? borderRadius;

  Decoration({
    this.color,
    this.border,
    this.boxShadow,
    this.borderRadius,
    this.gradient,
    this.image,
  });

  @override
  String toString() {
    return 'Decoration(color: $color, border: $border, boxShadow: $boxShadow, borderRadius: $borderRadius, gradient: $gradient, image: $image)';
  }
}

/// The border type can be solid, dashed, dotted, double, groove, ridge, inset, or outset
/// The border radius is the radius of the border
enum BorderType { solid, dashed, dotted, double, groove, ridge, inset, outset }

/// The Border class is used to add a border to a widget
/// It has a width, color [Color], type [BorderType], and border radius
class Border {
  final BorderSide? side;
  final Color? color;
  final BorderType? type;

  Border({this.side, this.color, this.type = BorderType.solid});
}

/// The BorderSide class is used to add a border to a widget
/// It has side, width, color [Color], and type [BorderType]

class BorderSide {
  final int top;
  final int right;
  final int bottom;
  final int left;

  const BorderSide({
    this.top = 0,
    this.right = 0,
    this.bottom = 0,
    this.left = 0,
  });

  BorderSide.all(int value)
      : top = value,
        right = value,
        bottom = value,
        left = value;

  BorderSide.only({
    this.top = 0,
    this.right = 0,
    this.bottom = 0,
    this.left = 0,
  });

  @override
  String toString() {
    return '${top}px ${right}px ${bottom}px ${left}px';
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

  /// The fill value stretches the widget to fill the container
  static const BoxFit fill = BoxFit._('fill');

  /// The contain value fits the widget in the container without stretching
  static const BoxFit contain = BoxFit._('contain');

  /// The cover value stretches the widget to fill the container
  static const BoxFit cover = BoxFit._('cover');

  /// The fitWidth value fits the widget in the container without stretching
  static const BoxFit fitWidth = BoxFit._('fit-width');

  /// The fitHeight value fits the widget in the container without stretching
  static const BoxFit fitHeight = BoxFit._('fit-height');

  /// The none value does not fit the widget in the container
  static const BoxFit none = BoxFit._('none');

  /// The scaleDown value fits the widget in the container without stretching
  static const BoxFit scaleDown = BoxFit._('scale-down');

  @override
  String toString() => _value;
}

/// The [BoxConstraints] class is used to set the constraints of a widget
/// It has a minimum width, maximum width, minimum height, and maximum height

class BoxConstraints {
  final Dimensions? minWidth;
  final Dimensions? maxWidth;
  final Dimensions? minHeight;
  final Dimensions? maxHeight;

  BoxConstraints({
    this.minWidth,
    this.maxWidth,
    this.minHeight,
    this.maxHeight,
  });

  /// The [copyWith] method is used to copy the current [BoxConstraints] object
  ///
  BoxConstraints copyWith({
    Dimensions? minWidth,
    Dimensions? maxWidth,
    Dimensions? minHeight,
    Dimensions? maxHeight,
  }) {
    return BoxConstraints(
      minWidth: minWidth ?? this.minWidth,
      maxWidth: maxWidth ?? this.maxWidth,
      minHeight: minHeight ?? this.minHeight,
      maxHeight: maxHeight ?? this.maxHeight,
    );
  }

  @override
  String toString() {
    return 'min-width: ${minWidth ?? ''}; max-width: ${maxWidth ?? double.infinity}; min-height: ${minHeight ?? ''}; max-height: ${maxHeight ?? double.infinity};';
  }
}

/// The [BorderRadius] class is used to set the border radius of a widget
/// It has a top left, top right, bottom left, and bottom right radius
/// It has the following constructors:
/// - BorderRadius.circular(double radius)
/// - BorderRadius.only({double topLeft = 0, double topRight = 0, double bottomLeft = 0, double bottomRight = 0})
/// - BorderRadius.all(double radius)
///
/// The BorderRadius.circular(double radius) constructor is used to set the same border radius for all corners
/// The BorderRadius.only({double topLeft = 0, double topRight = 0, double bottomLeft = 0, double bottomRight = 0}) constructor is used to set the border radius for each corner
/// The BorderRadius.all(double radius) constructor is used to set the same border radius for all corners
///
/// Example:
/// ```dart
/// BorderRadius.circular(10)
/// BorderRadius.only(topLeft: 10, topRight: 10, bottomLeft: 10, bottomRight: 10)
/// BorderRadius.all(10)
/// ```
class BorderRadius {
  final double topLeft;
  final double topRight;
  final double bottomLeft;
  final double bottomRight;

  BorderRadius({
    required this.topLeft,
    required this.topRight,
    required this.bottomLeft,
    required this.bottomRight,
  });

  /// The [BorderRadius.circular] constructor is used to set the same border radius for all corners
  /// Example:
  /// ```dart
  /// BorderRadius.circular(10)
  /// ```
  factory BorderRadius.circular(double radius) {
    return BorderRadius(
      topLeft: radius,
      topRight: radius,
      bottomLeft: radius,
      bottomRight: radius,
    );
  }

  /// The [BorderRadius.only] constructor is used to set the border radius for each corner
  /// Example:
  /// ```dart
  /// BorderRadius.only(topLeft: 10, topRight: 10, bottomLeft: 10, bottomRight: 10)
  /// ```
  factory BorderRadius.only({
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
  }) {
    return BorderRadius(
      topLeft: topLeft,
      topRight: topRight,
      bottomLeft: bottomLeft,
      bottomRight: bottomRight,
    );
  }

  /// The [BorderRadius.all] constructor is used to set the same border radius for all corners
  /// Example:
  /// ```dart
  /// BorderRadius.all(10)
  /// ```
  factory BorderRadius.all(double radius) {
    return BorderRadius.circular(radius);
  }

  @override
  String toString() {
    return '${topLeft}px ${topRight}px ${bottomRight}px ${bottomLeft}px';
  }
}

class Gradient {
  final List<Color> colors;
  final List<double>? stops;
  final GradientType? type;

  Gradient({
    required this.colors,
    this.stops,
    this.type = GradientType.linear,
  });

  @override
  String toString() {
    if (type == GradientType.linear) {
      return 'linear-gradient(${colors.map((e) => e.rgba).join(', ')})';
    }
    if (type == GradientType.radial) {
      return 'radial-gradient(${colors.map((e) => e.rgba).join(', ')})';
    }
    if (type == GradientType.sweep) {
      return 'sweep-gradient(${colors.map((e) => e.rgba).join(', ')})';
    }
    if (type == GradientType.conic) {
      return 'conic-gradient(${colors.map((e) => e.rgba).join(', ')})';
    }
    if (type == GradientType.image) {
      return 'image-gradient(${colors.map((e) => e.rgba).join(', ')})';
    }
    if (type == GradientType.repeatingLinear) {
      return 'repeating-linear-gradient(${colors.map((e) => e.rgba).join(', ')})';
    }
    if (type == GradientType.repeatingRadial) {
      return 'repeating-radial-gradient(${colors.map((e) => e.rgba).join(', ')})';
    }
    if (type == GradientType.repeatingSweep) {
      return 'repeating-sweep-gradient(${colors.map((e) => e.rgba).join(', ')})';
    }
    return '';
  }
}

/// The [GradientType] class is used to set the gradient type of a widget
/// It has the following values:
/// - linear : The linear value sets the gradient type to linear
/// - radial : The radial value sets the gradient type to radial
/// - sweep : The sweep value sets the gradient type to sweep
/// - conic : The conic value sets the gradient type to conic
/// - image : The image value sets the gradient type to image
/// - repeatingLinear : The repeatingLinear value sets the gradient type to repeatingLinear
/// - repeatingRadial : The repeatingRadial value sets the gradient type to repeatingRadial
/// - repeatingSweep : The repeatingSweep value sets the gradient type to repeatingSweep

class GradientType {
  final String _value;

  const GradientType._(this._value);

  /// The linear value sets the gradient type to linear
  static const GradientType linear = GradientType._('linear');

  /// The radial value sets the gradient type to radial
  static const GradientType radial = GradientType._('radial');

  /// The sweep value sets the gradient type to sweep
  static const GradientType sweep = GradientType._('sweep');

  /// The conic value sets the gradient type to conic
  static const GradientType conic = GradientType._('conic');

  /// The image value sets the gradient type to image
  static const GradientType image = GradientType._('image');

  /// The repeatingLinear value sets the gradient type to repeatingLinear
  static const GradientType repeatingLinear =
      GradientType._('repeating-linear');

  /// The repeatingRadial value sets the gradient type to repeatingRadial
  static const GradientType repeatingRadial =
      GradientType._('repeating-radial');

  /// The repeatingSweep value sets the gradient type to repeatingSweep
  static const GradientType repeatingSweep = GradientType._('repeating-sweep');

  @override
  String toString() => _value;
}

/// The [DecorationImage] class is used to set the background image of a widget
/// It has the following parameters:
/// - src : The src parameter is used to set the image source
/// - align : The align parameter is used to set the image alignment
/// - repeat : The repeat parameter is used to set the image repeat
/// - fit : The fit parameter is used to set the image fit
class DecorationImage {
  final String src;
  final TextAlign? align;
  final bool? repeat;
  final BoxFit? fit;

  DecorationImage({
    required this.src,
    this.align = TextAlign.center,
    this.repeat = false,
    this.fit = BoxFit.cover,
  });

  @override
  String toString() {
    if (repeat!) {
      return '${align?.value} / $fit url($src)';
    }
    return '${align?.value} / $fit no-repeat url($src)';
  }
}

/// The TextAlign property aligns the text to the specified side in it's main axis
///
/// Example:
/// ```dart
/// Text(
///  'Hello World',
/// textAlign: TextAlign.center,
/// )
class TextAlign {
  final String value;

  const TextAlign._(this.value);

  static const left = TextAlign._('left');
  static const right = TextAlign._('right');
  static const center = TextAlign._('center');
  static const justify = TextAlign._('justify');
  static const start = TextAlign._('start');
  static const end = TextAlign._('end');
}