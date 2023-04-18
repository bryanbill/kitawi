import 'dart:html';
import 'dart:math';

import 'package:kitawi/widgets.dart';

class TextField extends Widget {
  final TextEditingController? controller;
  // The controller that controls the text in the text field

  final InputDecoration? decoration;
  // The decoration for the text field

  final Function(String)? onChanged;
  // A function that is called when the text in the text field changes

  final Function(String)? onSubmitted;
  // A function that is called when the text in the text field is submitted

  final TextInputType? keyboardType;
  // The type of keyboard that shows up when the text field is focused

  final bool? autofocus;
  // Whether the text field should be focused when the app starts

  final bool? obscureText;
  // Whether the text in the text field should be obscured

  final RegExp? validator;
  // A regular expression that is used to validate the text in the text field

  final TextAlign? textAlign;
  final TextAlign? textAlignVertical;
  // The alignment of the text in the text field

  final TextStyle? style;
  // The style of the text in the text field

  final int? maxLines;
  // The maximum number of lines that the text field can have

  TextField(
      {Key? key,
      this.controller,
      this.decoration,
      this.keyboardType,
      this.onChanged,
      this.onSubmitted,
      this.maxLines = 1,
      this.textAlign = TextAlign.start,
      this.textAlignVertical = TextAlign.center,
      this.style,
      this.autofocus = true,
      this.obscureText = false,
      this.validator})
      : super(key: key);

  @override
  Element createElement() {
    dynamic input = (((maxLines == null || maxLines! > 1)
        ? TextAreaElement()
        : InputElement())
      ..id = key?.value ?? Random.secure().nextInt(100000).toString()
      ..style.height = '100%'
      ..style.width = '100%'
      ..style.border = 'none'
      ..style.outline = 'none'
      ..style.padding = '0'
      ..style.margin = '0'
      ..style.backgroundColor = decoration?.fillColor?.rgba ?? 'transparent'
      ..style.tapHighlightColor = 'transparent'
      ..style.flex = '1'
      ..style.fontFamily = style?.fontFamily
      ..style.fontSize = '${style?.fontSize}px'
      ..style.fontWeight = '${style?.fontWeight?.index}'
      ..style.fontStyle = style?.fontStyle?.value
      ..style.display = 'flex'
      ..style.color = style?.color?.rgba
      ..style.alignItems = textAlignVertical!.value
      ..style.textAlign = textAlign?.value);
    if (maxLines != null && maxLines! > 1) {
      input = input as TextAreaElement;
      input.rows = maxLines!;
    } else {
      input = input as InputElement;
    }
    if (controller != null) {
      input.value = controller!.text;
      input.onInput.listen((event) {
        controller!.setText(input.value ?? '');
      });
    }

    if (onChanged != null) {
      input.onInput.listen((event) {
        onChanged!(input.value ?? '');
      });
    }

    if (onSubmitted != null) {
      input.onKeyDown.listen((event) {
        if (event.keyCode == 13) {
          onSubmitted!(input.value ?? '');
        }
      });
    }

    if (keyboardType != null && maxLines == 1) {
      switch (keyboardType) {
        case TextInputType.emailAddress:
          input.type = 'email';
          break;
        case TextInputType.number:
          input.type = 'number';
          break;
        case TextInputType.phone:
          input.type = 'tel';
          break;
        case TextInputType.url:
          input.type = 'url';
          break;
        case TextInputType.visiblePassword:
          input.type = 'text';
          break;
        default:
          input.type = 'text';
          break;
      }
    }

    if (autofocus != null) {
      input.autofocus = autofocus!;
    }

    if (obscureText != null && maxLines == 1) {
      input.type = obscureText! ? 'password' : 'text';
    }

    if (validator != null) {
      input.pattern = validator!.pattern;
    }

    input.placeholder = decoration?.hintText ?? '';

    var wrapperDiv = DivElement()
      ..id = key?.value ?? Random.secure().toString()
      ..style.display = 'flex'
      ..style.alignItems = 'center'
      ..style.padding = decoration?.contentPadding?.toString() ?? '5px'
      ..style.backgroundColor = decoration?.fillColor?.rgba ?? 'auto'
      ..style.borderRadius = decoration?.borderRadius?.toString() ?? 'inherit'
      ..style.borderColor = decoration?.border?.color?.rgba ?? 'auto'
      ..style.borderWidth = decoration?.border?.side != null
          ? '${decoration?.border?.side}'
          : 'auto'
      ..style.borderStyle =
          decoration?.border?.type?.toString().split(".").last ?? 'auto';

    var prefix = SpanElement()
      ..style.marginRight = '10px'
      ..style.display = 'flex'
      ..style.alignItems = 'center'
      ..append(decoration?.prefixIcon?.createElement() ?? DivElement());

    var suffix = SpanElement()
      ..style.marginLeft = '10px'
      ..style.display = 'flex'
      ..style.alignItems = 'center'
      ..append(decoration?.suffixIcon?.createElement() ?? DivElement());

    wrapperDiv.children = [
      decoration?.prefixIcon != null ? prefix : DivElement(),
      input,
      decoration?.suffixIcon != null ? suffix : DivElement(),
    ];

    if (decoration?.contentPadding != null) {
      var paddingLeft = decoration?.contentPadding?.left ?? 0;
      var paddingRight = decoration?.contentPadding?.right ?? 0;
      var paddingTop = decoration?.contentPadding?.top ?? 0;
      var paddingBottom = decoration?.contentPadding?.bottom ?? 0;
      wrapperDiv.style.width =
          '${Dimensions.calc(from: 100.percent, inset: Dimensions.of("${paddingLeft + paddingRight}px"))}';
      wrapperDiv.style.height =
          '${Dimensions.calc(from: 100.percent, inset: Dimensions.of("${paddingTop + paddingBottom}px"))}';
    } else {
      wrapperDiv.style.width = 'calc(100% - 10px)';
      wrapperDiv.style.height = 'calc(100% - 10px)';
    }

    return wrapperDiv;
  }
}

/// A text editing controller maintains the current state of editing a text
/// input. It can be used to [addListener] to changes in the text and to
/// [text] to set the current value of the editing. It can also be used to
/// [clear] the text.
///
/// This class is a [ChangeNotifier], so it can be used to listen to changes in
/// the text by calling [addListener] and supplying a callback function. When
/// the text changes, the provided callback will be called.
class TextEditingController {
  TextEditingController({this.text = ''});

  String text;

  void setText(String value) {
    text = value;
  }

  void clear() {
    text = '';
  }
}

/// This class is used to describe the visual properties of an input field, such as
/// a text field, with the exception of the label. The label is defined in
/// [InputDecoration.labelText].
///
/// An [InputDecoration] object is passed as the `decoration` argument to the
/// [InputDecoration] and [TextField] constructors. The [TextField] classe is used to implement material design's input fields.
///
/// The [InputDecoration] class provides a number of ways to customize the look
/// of an input decorator. The most important properties are [hintText],
/// [helperText], [errorText], [prefixIcon], [suffixIcon],
///  and [border]. The [hintText] is displayed when the input decorator's
/// child is empty, e.g. when the child is a [TextField] and the user hasn't
/// entered any text. The [helperText] is displayed below the input decorator's
/// child. The [errorText] is displayed below the input decorator's child when
/// the input decorator's [InputDecoration.errorText] property is non-null.
/// The [prefixIcon] and [suffixIcon] are displayed at the top and bottom of the
/// input decorator's child, respectively. The [border] defines the
/// input decorator's border.
///
/// The [InputDecoration] class provides a number of properties that are used to
/// define the visual layout of the input decorator's elements. The
/// [InputDecoration.contentPadding] property defines the input decorator's
/// internal padding, i.e. the padding between the input decorator's border and
/// all of its contents (i.e. the input decorator's child, its label, its
/// helper/error text, its counter text, its prefix/suffix text, etc.).
class InputDecoration {
  InputDecoration(
      {this.hintText,
      this.helperText,
      this.errorText,
      this.prefixIcon,
      this.suffixIcon,
      this.border,
      this.focusedBorder,
      this.enabledBorder,
      this.errorBorder,
      this.fillColor,
      this.focusColor,
      this.hoverColor,
      this.errorColor,
      this.labelText,
      this.contentPadding,
      this.borderRadius});

  final String? labelText;

  final String? hintText;

  final String? helperText;

  final String? errorText;

  final Widget? prefixIcon;

  final Widget? suffixIcon;

  final Border? border;

  final Border? focusedBorder;

  final Border? enabledBorder;

  final Border? errorBorder;

  final Color? fillColor;

  final Color? focusColor;

  final Color? hoverColor;

  final Color? errorColor;

  final EdgeInsets? contentPadding;

  final BorderRadius? borderRadius;
}

/// [TextInputType] is enumerated in the engine, however here we duplicate it since
/// the framework code has no dependency on the engine.
enum TextInputType {
  /// Normal text input, which can include characters from any language.
  text,

  /// Like [text], but will prevent the user from entering new lines.
  multiline,

  /// For entering numbers, including decimal numbers.
  ///
  /// Uses the native keyboard on iOS, which includes easy access to the
  /// decimal separator and number keypad. On Android, shows a number keypad
  /// with only digits 0-9.
  number,

  /// For entering a date or time (depending on the user's locale).
  ///
  /// Displays a native selector on iOS for picking a date or time (as
  /// appropriate for the user's locale) and a text input field with
  /// the selected date/time formatted to a short string on Android.
  datetime,

  /// For entering an email address.
  ///
  /// Shows "@." keyboard on iOS and a text input field with type=email on
  /// Android.
  emailAddress,

  /// For entering a URL.
  ///
  /// Shows ".com/" keyboard on iOS and a text input field with type=url on
  /// Android.
  url,

  /// For entering a password where it is important to show the characters
  /// being entered.
  ///
  /// Shows a keyboard with all keys, but does not automatically do things like
  /// autocorrect or suggest words.
  visiblePassword,

  /// For entering a telephone number.
  ///
  /// Shows a number pad with buttons for the digits 0-9, *, #, +, -, (, ), and
  /// "p" on iOS and a text input field with type=tel on Android.
  phone,
}
