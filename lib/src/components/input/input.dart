import 'package:kitawi/kitawi.dart';

/// Input type enumeration.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input
enum InputType {
  text,
  password,
  email,
  number,
  tel,
  url,
  search,
  date,
  time,
  month,
  week,
  datetime,
  color,
  file,
  checkbox,
  radio,
  textarea,
}

class Input extends Component {
  /// Text input component.
  ///
  /// The [type] parameter is used to determine the type of the input.

  /// The [controller] parameter is used to control the input element.
  final InputController? controller;

  final String? name;

  final String? placeholder;

  final void Function(String?)? onChangeText;
  final void Function(String?)? onSubmitted;

  final String? value;

  Input({
    this.name,
    this.placeholder,
    this.type = InputType.text,
    super.id,
    this.controller,
    this.value,
    super.attributes,
    super.style,
    super.className,
    super.children,
    super.onClick,
    super.onDoubleClick,
    super.onContextMenu,
    super.onDragStart,
    super.onDrag,
    super.onDragEnd,
    super.onDragEnter,
    super.onDragOver,
    super.onDragLeave,
    super.onDrop,
    super.onKeyDown,
    super.onKeyPress,
    super.onKeyUp,
    super.onMouseOver,
    super.onMouseOut,
    super.onMouseDown,
    super.onMouseUp,
    super.onInput,
    super.onChange,
    this.onChangeText,
    super.onMouseMove,
    this.onSubmitted,
  }) : super(
          tag: 'input',
        );

  InputType type = InputType.text;

  @override
  Element render() {
    var element = super.render() as HTMLInputElement;

    element.type = type.name == "datetime" ? "datetime-local" : type.name;

    if (controller != null) {
      controller!.input = element;
    }

    if (name != null) {
      element.name = name!;
    }

    if (placeholder != null) {
      element.placeholder = placeholder!;
    }

    element.onInput.listen((event) {
      if (onChangeText != null) {
        onChangeText!(element.value);
      }
    });

    element.onKeyDown.listen((event) {
      // ignore this when the form is autofilled
      if (event != KeyboardEvent) return;

      if (onKeyDown != null) {
        onKeyDown!(event);
      }

      if (event.key == 'Enter' && onSubmitted != null) {
        onSubmitted!(element.value);
      }
    });

    if (value != null) {
      element.value = value!;
    }

    return element;
  }
}
