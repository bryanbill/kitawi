import 'package:kitawi/src/components/component.dart';

class Div extends Component {
  /// Div component is the most basic component that can be rendered.
  ///
  /// It is a block-level element that can be styled with CSS and generally
  /// has no meaning other than to group elements together.
  Div(
      {super.id,
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
      super.onWheel})
      : super(tag: "div");
}
