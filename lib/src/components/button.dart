import 'package:kitawi/src/basic.dart';
import 'dart:html' as html;

/// A button widget that can be clicked to trigger an action.
///
/// The `Button` widget allows you to create a button element with a given child
/// widget and an action to perform when it's clicked. You can also specify
/// various decorations like the background color, padding, margin, width and
/// height of the button.
///
/// Example usage:
///
/// ```dart
/// Button(
///   child: Text('Click me'),
///   action: Action(type: 'click', callback: (event) => print('Button clicked')),
///   decoration: BoxDecoration(color: Colors.blue),
///   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
///   margin: EdgeInsets.only(top: 16),
///   width: 200,
///   height: 50,
/// )
/// ```
class Button extends Widget {
  /// Creates a new `Button` widget with the given parameters.
  ///
  /// The [action] parameter is required and specifies the action to perform
  /// when the button is clicked. The [child] parameter is optional and specifies
  /// the child widget to display inside the button. The [decoration], [padding],
  /// [margin], [width] and [height] parameters are optional and specify the
  /// various decorations and layout properties of the button.
  Button({
    Key? key,
    required this.actions,
    this.child,
    this.decoration,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.borderRadius,
    this.borderColor,
    this.fontSize,
    this.textColor,
  }) : super(key: key);

  /// The child widget to display inside the button.
  final Widget? child;

  /// The action to perform when the button is clicked.
  final List<Action> actions;

  /// The decoration to apply to the button.
  final Decoration? decoration;

  /// The padding to apply to the button.
  final EdgeInsets? padding;

  /// The margin to apply to the button.
  final EdgeInsets? margin;

  /// The width of the button.
  final double? width;

  /// The height of the button.
  final double? height;

  /// The border radius of the button.
  final double? borderRadius;

  /// The color of the button border.
  final Color? borderColor;

  /// The font size of the button text.
  final double? fontSize;

  /// The color of the button text.
  /// If the text widget specified as the child of the button has a color
  /// specified, then this property will be ignored.
  final Color? textColor;

  @override
  html.Element createElement() {
    var button = html.ButtonElement()
      ..id = key?.value ?? ''
      ..style.backgroundColor = decoration?.color?.rgba ?? 'auto'
      ..style.borderColor = borderColor?.rgba ?? 'auto'
      ..style.borderRadius = '${borderRadius ?? 0}px'
      ..style.borderWidth = '${decoration?.border?.borderRadius ?? 0}px'
      ..style.color = 'inherit'
      ..style.cursor = 'pointer'
      ..style.display = 'flex'
      ..style.justifyContent = 'center'
      ..style.alignItems = 'center'
      ..style.margin = margin?.toString() ?? 'auto'
      ..style.outline = 'none'
      ..style.padding = padding?.toString() ?? '2px 2px'
      ..style.width = width != null ? '${width}px' : 'auto'
      ..style.height = height != null ? '${height}px' : 'auto';

    for (final action in actions) {
      button.on[action.type].listen((event) => action.callback(event));
    }

    if (child != null) {
      button.append(child!.render());
    }

    return button;
  }
}
