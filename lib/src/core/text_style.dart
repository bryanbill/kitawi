import 'dart:html';

import 'package:kitawi/src/core/color.dart';

/// A style that applies to a [Text].
///
class TextStyle {
  TextStyle({
    this.color,
    this.backgroundColor,
    this.fontFamily,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
  });

  /// The color of the text.
  ///
  /// If null, the text will be rendered with the default color.
  final Color? color;

  /// The background color of the text.
  ///
  final Color? backgroundColor;

  /// The font family to use when painting the text.
  final String? fontFamily;

  /// The size of the glyphs (in logical pixels) to use when painting the text.
  final double? fontSize;

  /// The font weight to use when painting the text.
  final FontWeight? fontWeight;

  /// The font style to use when painting the text.
  ///
  final FontStyle? fontStyle;
}

/// A font weight.
///
/// The font weights that match the numeric values specified by the
/// [CSS font-weight property](https://www.w3.org/TR/css-fonts-3/#propdef-font-weight) are as
/// follows:
///
/// * 100: [w100]
/// * 200: [w200]
/// * 300: [w300]
/// * 400: [w400]
/// * 500: [w500]
/// * 600: [w600]
/// * 700: [w700]
/// * 800: [w800]
/// * 900: [w900]
class FontWeight {
  const FontWeight._(this.index);

  /// The numeric value for this font weight.
  final int index;

  /// A font weight with a lighter value than [w400].
  static const FontWeight w100 = FontWeight._(0);

  /// A font weight with a lighter value than [w500].
  static const FontWeight w200 = FontWeight._(1);

  /// A font weight with a lighter value than [w600].
  static const FontWeight w300 = FontWeight._(2);

  /// The normal font weight.
  static const FontWeight w400 = FontWeight._(3);

  /// A font weight with a heavier value than [w400].
  static const FontWeight w500 = FontWeight._(4);

  /// A font weight with a heavier value than [w500].
  static const FontWeight w600 = FontWeight._(5);

  /// A font weight with a heavier value than [w600].
  static const FontWeight w700 = FontWeight._(6);

  /// A font weight with a heavier value than [w700].
  static const FontWeight w800 = FontWeight._(7);

  /// A font weight with a heavier value than [w800].
  static const FontWeight w900 = FontWeight._(8);

  /// A font weight with a heavier value than [w900].
  static const FontWeight bold = FontWeight.w700;

  /// A font weight with a lighter value than [w100].
  static const FontWeight light = FontWeight.w300;

  /// A font weight with a heavier value than [w900].
  static const FontWeight normal = FontWeight.w400;

  /// A font weight with a heavier value than [w900].
  static const FontWeight thin = FontWeight.w100;
}

/// A font style.
///
/// The font styles that match the CSS font-style property are as follows:
///
/// * [normal]: The glyphs are rendered using the default style for the font.
/// * [italic]: The glyphs are rendered using an italic style.
/// * [oblique]: The glyphs are rendered using an oblique style.
class FontStyle {
  const FontStyle._(this.index);

  /// The numeric value for this font style.
  final int index;

  /// The glyphs are rendered using the default style for the font.
  static const FontStyle normal = FontStyle._(0);

  /// The glyphs are rendered using an italic style.
  static const FontStyle italic = FontStyle._(1);

  /// The glyphs are rendered using an oblique style.
  static const FontStyle oblique = FontStyle._(2);

  String get value {
    switch (index) {
      case 0:
        return 'normal';
      case 1:
        return 'italic';
      case 2:
        return 'oblique';
      default:
        return 'normal';
    }
  }
}
