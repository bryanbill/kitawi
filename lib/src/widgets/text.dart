import 'dart:html';

import 'package:kitawi/src/core/foundation.dart';
import 'package:kitawi/src/core/key.dart';
import 'package:kitawi/src/core/text_style.dart';
import 'package:kitawi/src/themes/theme.dart';
import 'package:kitawi/src/widgets/widget.dart';

/// The [TextTag] class is used to specify the tag name for the [Text] widget.
/// The [TextTag] class has the following values:
/// - [TextTag.h1] - The `h1` tag.
/// - [TextTag.h2] - The `h2` tag.
/// - [TextTag.h3] - The `h3` tag.
/// - [TextTag.h4] - The `h4` tag.
/// - [TextTag.h5] - The `h5` tag.
/// - [TextTag.h6] - The `h6` tag.
/// - [TextTag.p] - The `p` tag.
enum TextTag {
  h1,
  h2,
  h3,
  h4,
  h5,
  h6,
  p,
  span,
}

/// The [Text] class is a widget that displays a single line of text.
class Text extends Widget {
  /// Creates a new [Text] widget with the given parameters.
  final String text;

  /// The [style] parameter is optional and specifies the style of the text [TextStyle].
  final TextStyle? style;

  /// The [TextAlign] class is used to align the text in the [Text] widget.
  /// The [TextAlign] class has the following values:
  /// - [TextAlign.left] - Aligns the text to the left.
  /// - [TextAlign.right] - Aligns the text to the right.
  /// - [TextAlign.center] - Aligns the text to the center.
  /// - [TextAlign.justify] - Aligns the text to the justify.
  /// - [TextAlign.start] - Aligns the text to the start.
  /// - [TextAlign.end] - Aligns the text to the end.
  ///
  /// The default value is [TextAlign.left].
  final TextAlign? textAlign;

  /// The tag name for the [Text] widget.
  /// The default value is `p`.
  ///
  TextTag tag;

  Text(
    this.text, {
    Key? key,
    this.style,
    this.textAlign = TextAlign.left,
    this.tag = TextTag.p,
  }) : super(key: key);

  /// The [createElement] method creates the [ParagraphElement] for the widget.

  @override
  Element createElement() {
    // create a text element based on the tag
    var element = tag == TextTag.p
        ? ParagraphElement()
        : tag == TextTag.h1
            ? HeadingElement.h1()
            : tag == TextTag.h2
                ? HeadingElement.h2()
                : tag == TextTag.h3
                    ? HeadingElement.h3()
                    : tag == TextTag.h4
                        ? HeadingElement.h4()
                        : tag == TextTag.h5
                            ? HeadingElement.h5()
                            : tag == TextTag.h6
                                ? HeadingElement.h6()
                                : SpanElement();
    return element
      ..text = text
      ..style.color = style?.color?.rgba
      ..style.backgroundColor = style?.backgroundColor?.rgba
      ..style.fontFamily = style?.fontFamily
      ..style.fontSize = '${style?.fontSize}'
      ..style.fontWeight = style?.fontWeight?.index.toString()
      ..style.fontStyle = style?.fontStyle?.value
      ..style.padding = '0'
      ..style.margin = '0'
      ..style.textAlign = textAlign?.value
      ..style.textDecoration = style?.textDecoration?.toString();
  }

  /// The [h1] method creates a new [Text] widget with the [TextTheme.headline1] style.
  static Widget h1(String text, {Key? key, TextStyle? style}) {
    return Text(text,
        key: key,
        style: style ?? Theme.themeData?.textTheme?.headline1,
        tag: TextTag.h1);
  }

  /// The [h2] method creates a new [Text] widget with the [TextTheme.headline2] style.
  static Widget h2(String text, {Key? key, TextStyle? style}) {
    return Text(text,
        key: key,
        style: style ?? Theme.themeData?.textTheme?.headline2,
        tag: TextTag.h2);
  }

  /// The [h3] method creates a new [Text] widget with the [TextTheme.headline3] style.
  static Widget h3(String text, {Key? key, TextStyle? style}) {
    return Text(text,
        key: key,
        style: style ?? Theme.themeData?.textTheme?.headline3,
        tag: TextTag.h3);
  }

  /// The [h4] method creates a new [Text] widget with the [TextTheme.headline4] style.
  static Widget h4(String text, {Key? key, TextStyle? style}) {
    return Text(text,
        key: key,
        style: style ?? Theme.themeData?.textTheme?.headline4,
        tag: TextTag.h4);
  }

  /// The [h5] method creates a new [Text] widget with the [TextTheme.headline5] style.
  static Widget h5(String text, {Key? key, TextStyle? style}) {
    return Text(text,
        key: key,
        style: style ?? Theme.themeData?.textTheme?.headline5,
        tag: TextTag.h5);
  }

  /// The [h6] method creates a new [Text] widget with the [TextTheme.headline6] style.
  static Widget h6(String text, {Key? key, TextStyle? style}) {
    return Text(text,
        key: key,
        style: style ?? Theme.themeData?.textTheme?.headline6,
        tag: TextTag.h6);
  }

  /// The [body1] method creates a new [Text] widget with the [TextTheme.bodyText1] style.
  static Widget body1(String text, {Key? key, TextStyle? style}) {
    return Text(text,
        key: key,
        style: style ?? Theme.themeData?.textTheme?.bodyText1,
        tag: TextTag.p);
  }

  static Widget body2(String text, {Key? key, TextStyle? style}) {
    return Text(text,
        key: key,
        style: style ?? Theme.themeData?.textTheme?.bodyText2,
        tag: TextTag.p);
  }

  /// The [subtitle1] method creates a new [Text] widget with the [TextTheme.subtitle1] style.
  static Widget subtitle1(String text, {Key? key, TextStyle? style}) {
    return Text(
      text,
      key: key,
      style: style ?? Theme.themeData?.textTheme?.subtitle1,
      tag: TextTag.span,
    );
  }

  /// The [subtitle2] method creates a new [Text] widget with the [TextTheme.subtitle2] style.
  static Widget subtitle2(String text, {Key? key, TextStyle? style}) {
    return Text(
      text,
      key: key,
      style: style ?? Theme.themeData?.textTheme?.subtitle2,
      tag: TextTag.span,
    );
  }

  /// The [caption] method creates a new [Text] widget with the [TextTheme.caption] style.
  static Widget caption(String text, {Key? key, TextStyle? style}) {
    return Text(
      text,
      key: key,
      style: style ?? Theme.themeData?.textTheme?.caption,
      tag: TextTag.span,
    );
  }

  /// The [overline] method creates a new [Text] widget with the [TextTheme.overline] style.
  static Widget overline(String text, {Key? key, TextStyle? style}) {
    return Text(
      text,
      key: key,
      style: style ?? Theme.themeData?.textTheme?.overline,
      tag: TextTag.span,
    );
  }
}
