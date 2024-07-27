import 'package:kitawi/src/utils/ref.dart';
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
  ///
  /// The [ref] parameter is used to determine the reference of the input.
  Input({
    this.type = InputType.text,
    super.id,
    super.ref,
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

  @override
  Element render() {
    final element = super.render() as HTMLInputElement;

    if (ref != null) {
      (ref as Ref<HTMLInputElement>).element = element;
    }

    element.type = type.name;

    return element;
  }

  void clear() {
    (ref as Ref<HTMLInputElement>).element!.value = '';
  }

  void focus() {
    (ref as Ref<HTMLInputElement>).element!.focus();
  }

  void blur() {
    (ref as Ref<HTMLInputElement>).element!.blur();
  }

  void select() {
    (ref as Ref<HTMLInputElement>).element!.select();
  }

  void click() {
    (ref as Ref<HTMLInputElement>).element!.click();
  }

  void setSelectionRange(int start, int end) {
    (ref as Ref<HTMLInputElement>).element!.setSelectionRange(start, end);
  }

  void setRangeText(String replacement, {bool select = false}) {
    (ref as Ref<HTMLInputElement>).element!.setRangeText(replacement);
  }
}
