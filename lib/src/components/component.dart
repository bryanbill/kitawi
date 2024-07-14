import "package:kitawi/src/tailwind/tailwind.dart";
import "package:web/web.dart";

/// This is the base building block for all components.
///
/// It inherits the behavior of [Element] and adds additional functionality
/// such as rendering and updating the component.
///
/// Components are the building blocks of a UI. They can be composed together
/// to create complex UIs.
class Component {
  /// The tag name of the element.
  final String tag;

  /// The attributes of the element.
  final Map<String, String> attributes;

  /// The style of the element.
  final String? style;

  /// Css class name of the element.
  final String? className;

  /// The children of the element.
  final List<Component> children;

  /// The class name of the element.
  final Tailwind? tailwind;

  /// Callback for the `click` event.
  final void Function(Event)? onClick;

  /// Callback for the `doubleclick` event.
  final void Function(Event)? onDoubleClick;

  /// Callback for the `contextmenu` event.
  final void Function(Event)? onContextMenu;

  final void Function(Event)? onDragStart;
  final void Function(Event)? onDrag;
  final void Function(Event)? onDragEnd;
  final void Function(Event)? onDragEnter;
  final void Function(Event)? onDragOver;
  final void Function(Event)? onDragLeave;
  final void Function(Event)? onDrop;

  final void Function(Event)? onKeyDown;
  final void Function(Event)? onKeyPress;
  final void Function(Event)? onKeyUp;

  final void Function(Event)? onMouseOver;
  final void Function(Event)? onMouseOut;
  final void Function(Event)? onMouseDown;
  final void Function(Event)? onMouseUp;
  final void Function(Event)? onMouseMove;

  final void Function(Event)? onInput;
  final void Function(Event)? onChange;
  final void Function(Event)? onSubmit;

  final void Function(Event)? onFocus;
  final void Function(Event)? onBlur;

  final void Function(Event)? onScroll;

  Component({
    this.tag = "div",
    this.attributes = const {},
    this.children = const [],
    this.className,
    this.style,
    this.tailwind,
    this.onClick,
    this.onDoubleClick,
    this.onContextMenu,
    this.onDragStart,
    this.onDrag,
    this.onDragEnd,
    this.onDragEnter,
    this.onDragOver,
    this.onDragLeave,
    this.onDrop,
    this.onKeyDown,
    this.onKeyPress,
    this.onKeyUp,
    this.onMouseOver,
    this.onMouseOut,
    this.onMouseDown,
    this.onMouseUp,
    this.onMouseMove,
    this.onInput,
    this.onChange,
    this.onSubmit,
    this.onFocus,
    this.onBlur,
    this.onScroll,
  });

  Element? element;

  /// Appends an attribute to the element.
  void _renderAttributes(Element element) {
    for (final entry in attributes.entries) {
      if (entry.value.isEmpty) continue;
      element.setAttribute(entry.key, entry.value);
    }
  }

  /// Set event listeners for the element.
  void _registerEventListeners(Element element) {
    if (onClick != null) {
      element.onClick.listen(onClick!);
    }

    if (onDoubleClick != null) {
      element.onDoubleClick.listen(onDoubleClick!);
    }

    if (onContextMenu != null) {
      element.onContextMenu.listen(onContextMenu!);
    }

    if (onDragStart != null) {
      element.onDragStart.listen(onDragStart!);
    }

    if (onDrag != null) {
      element.onDrag.listen(onDrag!);
    }

    if (onDragEnd != null) {
      element.onDragEnd.listen(onDragEnd!);
    }

    if (onDragEnter != null) {
      element.onDragEnter.listen(onDragEnter!);
    }

    if (onDragOver != null) {
      element.onDragOver.listen(onDragOver!);
    }

    if (onDragLeave != null) {
      element.onDragLeave.listen(onDragLeave!);
    }

    if (onDrop != null) {
      element.onDrop.listen(onDrop!);
    }

    if (onKeyDown != null) {
      element.onKeyDown.listen(onKeyDown!);
    }

    if (onKeyPress != null) {
      element.onKeyPress.listen(onKeyPress!);
    }

    if (onKeyUp != null) {
      element.onKeyUp.listen(onKeyUp!);
    }

    if (onMouseOver != null) {
      element.onMouseOver.listen(onMouseOver!);
    }

    if (onMouseOut != null) {
      element.onMouseOut.listen(onMouseOut!);
    }

    if (onMouseDown != null) {
      element.onMouseDown.listen(onMouseDown!);
    }

    if (onMouseUp != null) {
      element.onMouseUp.listen(onMouseUp!);
    }

    if (onMouseMove != null) {
      element.onMouseMove.listen(onMouseMove!);
    }

    if (onInput != null) {
      element.onInput.listen(onInput!);
    }

    if (onChange != null) {
      element.onChange.listen(onChange!);
    }

    if (onSubmit != null) {
      element.onSubmit.listen(onSubmit!);
    }

    if (onFocus != null) {
      element.onFocus.listen(onFocus!);
    }

    if (onBlur != null) {
      element.onBlur.listen(onBlur!);
    }

    if (onScroll != null) {
      element.onScroll.listen(onScroll!);
    }
  }

  /// Creates an HTML Element represention of [Component].
  Element render() {
    // Create the element with the tag name.
    element ??= document.createElement(tag);

    if (element == null) {
      throw Exception("Could not create element with tag name: $tag");
    }

    if (className != null) {
      element?.className = className!;
    }

    if (style != null) {
      element!.setAttribute('style', style!);
    }

    if (tailwind != null) {
      element?.className = tailwind!.className;
    }

    _renderAttributes(element!);

    _registerEventListeners(element!);

    return element!;
  }

  /// Re-renders the component.
  void update() {
    final oldElement = element;
    element = null;
    oldElement?.replaceWith(render());
  }
}
