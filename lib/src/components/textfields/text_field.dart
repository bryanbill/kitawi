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

  final TextAlign? textAlign;
  final TextAlign? textAlignVertical;

  final TextStyle? style;

  final int? maxLines;

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
          '${Dimensions.calc(from: 100.percent, inset: Dimensions.of(paddingLeft + paddingRight))}';
      wrapperDiv.style.height =
          '${Dimensions.calc(from: 100.percent, inset: Dimensions.of(paddingTop + paddingBottom))}';
    } else {
      wrapperDiv.style.width = 'calc(100% - 10px)';
      wrapperDiv.style.height = 'calc(100% - 10px)';
    }

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
