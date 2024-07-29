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
  datetimeLocal,
  color,
}

class Input extends Component {
  /// Text input component.
  ///
  /// The [type] parameter is used to determine the type of the input.

  /// The [controller] parameter is used to control the input element.
  final InputController? controller;

  final String? name;
  Input({
    this.name,
    this.type = InputType.text,
    super.id,
    this.controller,
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
    super.onMouseMove,
  }) : super(
          tag: 'input',
        );

  InputType type = InputType.text;

  String get value => (element as HTMLInputElement).value;
  @override
  Element render() {
    final element = super.render() as HTMLInputElement;
    element.type = type.name;

    if (controller != null) {
      controller!.input = element;
    }

    if (name != null) {
      element.name = name!;
    }

    return element;
  }
}
