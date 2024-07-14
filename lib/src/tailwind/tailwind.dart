import 'package:kitawi/src/tailwind/size.dart';
import 'package:web/web.dart';

/// Provides a way to use Tailwind CSS in your components.
///
/// In debug mode, this class will inject the Tailwind CSS stylesheet into the
/// document head. In production mode, it will not inject the stylesheet.
///
/// You have to run the `npx tailwindcss` build command to generate the CSS file in
/// production mode.
class Tailwind {
  static void init() {
    final scriptElement = document.createElement('script') as HTMLScriptElement;
    scriptElement.src = 'https://cdn.tailwindcss.com';

    document.head?.append(scriptElement);
  }

  List<String>? _classes;

  /***
   * Background utilities
   */

  /// Adds a background color to the element.
  Tailwind bg(Color color) {
    _classes ??= [];
    _classes?.add('bg-${color.name}');
    return this;
  }

  /// Utilities for controlling how a background image behaves when scrolling.
  Tailwind bgAttachment(Attachment attachment) {
    _classes ??= [];
    _classes?.add('bg-${attachment.name}');
    return this;
  }

  /// Utilities for controlling the bounding box of an element's background.
  Tailwind bgClip(Strategy clip) {
    _classes ??= [];
    _classes?.add('bg-clip-${clip.name}');
    return this;
  }

  /// Utilities for controlling the position of an element's background image.
  Tailwind bgPosition(Position position) {
    _classes ??= [];
    _classes?.add('bg-${position.name}');
    return this;
  }

  /// Utilities for controlling the repetition of an element's background image
  Tailwind bgRepeat(RepeatMode mode) {
    _classes ??= [];
    _classes?.add('bg-${mode.name}');
    return this;
  }

  /// Utilities for controlling how an element's background is positioned relative to borders, padding, and content.
  Tailwind bgOrigin(Strategy origin) {
    if (origin == Strategy.text) {
      throw ArgumentError('bgOrigin does not support text strategy');
    }

    _classes ??= [];
    _classes?.add('bg-origin-${origin.name}');
    return this;
  }

  /// Utilities for controlling the background size of an element's background image.
  Tailwind bgSize(ObjectFit fit) {
    _classes ??= [];
    _classes?.add('bg-${fit.name}');
    return this;
  }

  /***
   * Text utilities
   */

  /// Utilities for controlling the text color of an element.
  Tailwind textColor(Color color) {
    _classes ??= [];
    _classes?.add('text-${color.name}');
    return this;
  }

  /// Utilities for controlling the alignment of text.
  Tailwind textAlignment(TextAlignment alignment) {
    _classes ??= [];
    _classes?.add('text-${alignment.name}');
    return this;
  }

  /// Utilities for controlling the decoration of text and its color.
  Tailwind textDecoration(
    TextDecoration decoration, {
    Color? color,

    ///  Utilities for controlling the style of text decorations
    DecorationStyle? style,

    /// Utilities for controlling the thickness of text decorations
    Size? thickness,

    /// The offset of the underline.
    Size? offSet,
  }) {
    _classes ??= [];
    _classes?.add(decoration.name);

    if (color != null) {
      _classes?.add('decoration-${color.name}');
    }

    if (style != null) {
      _classes?.add('decoration-${style.name}');
    }

    if (thickness != null) {
      _classes?.add('decoration-${thickness.size}');
    }

    if (offSet != null) {
      _classes?.add('underline-offset-${offSet.size}');
    }

    return this;
  }

  /// Utilities for controlling the transformation of text.
  Tailwind textTransform(TextTransform transform) {
    _classes ??= [];
    _classes?.add(transform.name);
    return this;
  }

  /// Utilities for controlling text overflow in an element.
  Tailwind textOverflow(TextOverflow overflow) {
    _classes ??= [];
    _classes?.add(overflow.name);
    return this;
  }

  /// Utilities for controlling how text wraps within an element.
  Tailwind textWrap(Wrap wrap) {
    _classes ??= [];
    _classes?.add(wrap.name);
    return this;
  }

  /// Utilities for controlling the amount of empty space shown before text in a block.
  Tailwind textIdent(Size indent) {
    _classes ??= [];
    _classes?.add('indent-${indent.size}');
    return this;
  }

  /// Utilities for controlling the vertical alignment of an inline or table-cell box.
  Tailwind verticalAlignment(TextVerticalAlignment alignment) {
    _classes ??= [];
    _classes?.add('align-${alignment.name}');
    return this;
  }

  /// Utilities for controlling an element's white-space property.
  Tailwind whitespace(WhiteSpace space) {
    _classes ??= [];
    _classes?.add('whitespace-${space.name}');
    return this;
  }

  /// Utilities for controlling word breaks in an element.
  Tailwind breakWord(WordBreak breakWord, {Hyphenation? hyphenation}) {
    _classes ??= [];
    _classes?.add('break-${breakWord.name}');
    if (hyphenation != null) {
      _classes?.add('hyphenation-${hyphenation.name}');
    }
    return this;
  }

  /// Utilities for controlling the content of the before and after pseudo-elements.
  Tailwind content(String content) {
    _classes ??= [];
    _classes?.add('content-$content');
    return this;
  }

  Tailwind font(String font) {
    _classes ??= [];
    _classes?.add('font-$font');
    return this;
  }

  Tailwind rounded(Size radius) {
    _classes ??= [];
    _classes?.add('rounded-${radius.size}');
    return this;
  }

  String get className => _classes?.join(' ') ?? '';
}

enum Hyphenation { none, manual, auto }

enum WordBreak { normal, words, all, keep }

enum WhiteSpace { normal, noWrap, pre, preLine, preWrap, breakSpaces }

extension WhiteSpaceOperation on WhiteSpace {
  String get name {
    switch (this) {
      case WhiteSpace.normal:
        return 'normal';
      case WhiteSpace.noWrap:
        return 'nowrap';
      case WhiteSpace.pre:
        return 'pre';
      case WhiteSpace.preLine:
        return 'pre-line';
      case WhiteSpace.preWrap:
        return 'pre-wrap';
      case WhiteSpace.breakSpaces:
        return 'break-spaces';
    }
  }
}

enum TextVerticalAlignment {
  /// Aligns the element to the baseline of its parent
  baseline,

  /// Aligns the element to the top of the parent element's font
  top,

  /// Aligns the element to the middle of the parent element's font
  middle,

  /// Aligns the element to the bottom of the parent element's font
  bottom,

  /// Aligns the element to the top of the text
  textTop,

  /// Aligns the element to the bottom of the text
  textBottom,

  /// Aligns the element to the subscript
  sub,

  /// Aligns the element to the super script
  upper
}

extension TextVerticalAlignmentOperation on TextVerticalAlignment {
  String get name {
    switch (this) {
      case TextVerticalAlignment.baseline:
        return 'baseline';
      case TextVerticalAlignment.top:
        return 'top';
      case TextVerticalAlignment.middle:
        return 'middle';
      case TextVerticalAlignment.bottom:
        return 'bottom';
      case TextVerticalAlignment.textTop:
        return 'text-top';
      case TextVerticalAlignment.textBottom:
        return 'text-bottom';
      case TextVerticalAlignment.sub:
        return 'sub';
      case TextVerticalAlignment.upper:
        return 'super';
    }
  }
}

enum Wrap { wrap, noWrap, balance, pretty }

extension WrapOperation on Wrap {
  String get name {
    switch (this) {
      case Wrap.wrap:
        return 'text-wrap';
      case Wrap.noWrap:
        return 'text-nowrap';
      case Wrap.balance:
        return 'text-balance';
      case Wrap.pretty:
        return 'text-pretty';
    }
  }
}

enum TextOverflow { truncate, ellipsis, clip }

extension TextOverflowOperation on TextOverflow {
  String get name {
    switch (this) {
      case TextOverflow.truncate:
        return 'truncate';
      case TextOverflow.ellipsis:
        return 'text-ellipsis';
      case TextOverflow.clip:
        return 'text-clip';
    }
  }
}

enum TextTransform { uppercase, lowercase, capitalize, normal }

extension TextTransformOperation on TextTransform {
  String get name {
    switch (this) {
      case TextTransform.uppercase:
        return 'uppercase';
      case TextTransform.lowercase:
        return 'lowercase';
      case TextTransform.capitalize:
        return 'capitalize';
      case TextTransform.normal:
        return 'normal-case';
    }
  }
}

enum DecorationStyle { solid, double, dotted, dashed, wavy }

extension DecorationStyleOperation on DecorationStyle {
  String get name {
    switch (this) {
      case DecorationStyle.solid:
        return 'solid';
      case DecorationStyle.double:
        return 'double';
      case DecorationStyle.dotted:
        return 'dotted';
      case DecorationStyle.dashed:
        return 'dashed';
      case DecorationStyle.wavy:
        return 'wavy';
    }
  }
}

enum TextDecoration { underline, lineThrough, overline, none }

extension TextDecorationOperation on TextDecoration {
  String get name {
    switch (this) {
      case TextDecoration.underline:
        return 'underline';
      case TextDecoration.lineThrough:
        return 'line-through';
      case TextDecoration.overline:
        return 'overline';
      case TextDecoration.none:
        return 'none';
    }
  }
}

enum TextAlignment {
  left,
  center,
  right,
  justify,
  start,
  end,
}

enum TailwindFont {
  sans,
  serif,
  mono,
}

extension TailwindFontOperation on TailwindFont {
  String get name {
    switch (this) {
      case TailwindFont.sans:
        return 'sans';
      case TailwindFont.serif:
        return 'serif';
      case TailwindFont.mono:
        return 'mono';
    }
  }

  operator [](String font) {
    return Tailwind().font(font);
  }
}

/// Represents a color in the Tailwind CSS color palette.
///
/// For example, `Color.red[500]` will return the class name `red-500`.
///
/// For extended colors, use the `Color` class directly.
///
/// For example, `Color('custom-color')` will return the class name `custom-color`.
class Color {
  static const Color transparent = Color('transparent');
  static const Color current = Color('current');
  static const Color inherit = Color('inherit');

  /// The color black.
  static const Color black = Color('black');

  /// The color white.
  static const Color white = Color('white');

  static const Color slate = Color('slate');
  static const Color gray = Color('gray');
  static const Color zinc = Color('zinc');
  static const Color neutral = Color('neutral');
  static const Color stone = Color('stone');

  static const Color red = Color('red');
  static const Color orange = Color('orange');
  static const Color amber = Color('amber');
  static const Color yellow = Color('yellow');

  static const Color lime = Color('lime');
  static const Color green = Color('green');
  static const Color emerald = Color('emerald');
  static const Color teal = Color('teal');

  static const Color cyan = Color('cyan');
  static const Color sky = Color('sky');
  static const Color blue = Color('blue');

  static const Color indigo = Color('indigo');
  static const Color violet = Color('violet');
  static const Color purple = Color('purple');

  static const Color fuchsia = Color('fuchsia');
  static const Color pink = Color('pink');
  static const Color rose = Color('rose');

  final String name;

  const Color(this.name);
}

extension ColorOperation on Color {
  /// Returns the color with the specified shade.
  operator [](int index) {
    return Color('$name-$index');
  }
}

enum Attachment { fixed, local, scroll }

enum Strategy { border, padding, content, text }

enum Position {
  top,
  right,
  bottom,
  left,
  center,
  topRight,
  topLeft,
  bottomRight,
  bottomLeft
}

extension PositionExtension on Position {
  String get name {
    switch (this) {
      case Position.top:
        return 'top';
      case Position.right:
        return 'right';
      case Position.bottom:
        return 'bottom';
      case Position.left:
        return 'left';
      case Position.center:
        return 'center';
      case Position.topRight:
        return 'top-right';
      case Position.topLeft:
        return 'top-left';
      case Position.bottomRight:
        return 'bottom-right';
      case Position.bottomLeft:
        return 'bottom-left';
    }
  }
}

enum RepeatMode { repeat, noRepeat, repeatX, repeatY, space, round }

extension RepeatModeOperation on RepeatMode {
  String get name {
    switch (this) {
      case RepeatMode.repeat:
        return 'repeat';
      case RepeatMode.noRepeat:
        return 'no-repeat';
      case RepeatMode.repeatX:
        return 'repeat-x';
      case RepeatMode.repeatY:
        return 'repeat-y';
      case RepeatMode.space:
        return 'space';
      case RepeatMode.round:
        return 'round';
    }
  }
}

enum ObjectFit { contain, cover, fill, none, scaleDown }

extension ObjectFitOperation on ObjectFit {
  String get name {
    switch (this) {
      case ObjectFit.contain:
        return 'contain';
      case ObjectFit.cover:
        return 'cover';
      case ObjectFit.fill:
        return 'fill';
      case ObjectFit.none:
        return 'none';
      case ObjectFit.scaleDown:
        return 'scale-down';
    }
  }
}
