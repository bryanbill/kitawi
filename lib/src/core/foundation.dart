import 'package:kitawi/src/core/color.dart';

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

enum BorderType { solid, dashed, dotted, double, groove, ridge, inset, outset }

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