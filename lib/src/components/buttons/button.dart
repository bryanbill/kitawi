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
  /// The [actions] parameter is required and specifies the action to perform
  /// when the button is clicked. The [child] parameter is optional and specifies
  /// the child widget to display inside the button. The [decoration] parameter is optional and specify the
  /// various decorations and layout properties of the button.
  Button(
      {Key? key,
      required this.actions,
      this.child,
      this.decoration,
      this.borderRadius,
      this.splashColor})
      : super(key: key);

  /// The child widget to display inside the button.
  final Widget? child;

  /// The action to perform when the button is clicked.
  final List<Action> actions;

  /// The decoration to apply to the button.
  final Decoration? decoration;

  /// The border radius of the button.
  final BorderRadius? borderRadius;

  /// The splash color of the button. This is the color that will be displayed
  /// when the button is clicked, hovered or focused.
  final Color? splashColor;

  @override
  html.Element createElement() {
    var button = html.ButtonElement()
      ..id = key?.value ?? ''
      ..style.width = '100%'
      ..style.height = '100%'
      ..style.overflow = 'hidden'
      ..style.backgroundColor = decoration?.color?.rgba ?? 'auto'
      ..style.borderColor = decoration?.border?.color?.rgba ?? 'auto'
      ..style.borderRadius = borderRadius?.toString() ?? 'inherit'
      ..style.borderWidth = '${decoration?.border?.side ?? 0}px'
      ..style.color = 'inherit'
      ..style.cursor = 'pointer'
      ..style.display = 'flex'
      ..style.justifyContent = 'center'
      ..style.alignItems = 'center'
      ..style.outline = 'none'
      ..style.tapHighlightColor = splashColor?.rgba ?? 'auto'
      ..style.textAlign = 'center';

    if (actions.isNotEmpty) {
      for (final action in actions) {
        button.on[action.type].listen((event) => action.callback(event));
      }
    }

    if (child != null) {
      button.append(child!.render());
    }

    return button;
  }
}
