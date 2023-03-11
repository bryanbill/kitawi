import 'dart:html';
import 'dart:math';

import 'package:kitawi/src/basic.dart';
import 'package:kitawi/src/state/change_notifier.dart';

class TextField extends Widget {
  final TextEditingController? controller;

  final InputDecoration? decoration;

  final Function(String)? onChanged;

  final Function(String)? onSubmitted;

  final TextInputType? keyboardType;

  final bool? autofocus;

  final bool? obscureText;

  final RegExp? validator;

  TextField(
      {Key? key,
      this.controller,
      this.decoration,
      this.keyboardType,
      this.onChanged,
      this.onSubmitted,
      this.autofocus = true,
      this.obscureText = false,
      this.validator})
      : super(key: key);

  @override
  Element createElement() {
    var input = InputElement()
      ..style.height = '100%'
      ..style.width = '100%'
      ..style.border = 'none'
      ..style.outline = 'none'
      ..style.padding = '0'
      ..style.margin = '0'
      ..style.backgroundColor = 'transparent'
      ..style.tapHighlightColor = 'transparent'
      ..style.flex = '1'
      ..style;

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

    if (keyboardType != null) {
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

    if (obscureText != null) {
      input.type = obscureText! ? 'password' : 'text';
    }

    if (validator != null) {
      input.pattern = validator!.pattern;
    }

    input.placeholder = decoration?.hintText ?? '';

    var wrapperDiv = DivElement()
      ..id = key?.value ?? Random.secure().toString()
      ..style.height = '100%'
      ..style.width = '100%'
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

    return wrapperDiv;
  }
}

class TextEditingController extends ChangeNotifier {
  TextEditingController({this.text = ''});

  String text;

  void setText(String value) {
    text = value;
  }

  void clear() {
    text = '';
  }

  @override
  void addListener(Function() listener) {
    super.addListener(listener);
    listener();
  }

  @override
  void dispose() {
    text = '';
    super.dispose();
  }
}

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

enum TextInputType {
  text,
  multiline,
  number,
  datetime,
  emailAddress,
  url,
  phoneNumber,
  visiblePassword,
  phone,
}
