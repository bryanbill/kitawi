import 'package:kitawi/kitawi.dart';

class Span extends Component {
  final String? text;

  /// Span component.
  Span({
    this.text,
    super.id,
    super.style,
    super.className,
    super.attributes,
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
    super.onMouseMove,
    super.onInput,
    super.onChange,
    super.onSubmit,
    super.onFocus,
    super.onBlur,
    super.onScroll,
    super.onWheel,
  }) : super(tag: "span");

  @override
  Element render() {
    final element = super.render();
    if (text != null) {
      element.text = text!;
    }

    return element;
  }
}
