import 'package:kitawi/src/components/component.dart';
import 'package:web/web.dart';

class Image extends Component {
  final String src;

  final String? alt;

  final String? width;

  final String? height;

  void Function(Event)? onLoad;
  void Function(Event)? onError;

  /// Image component.
  /// 
  /// The [src] parameter is used to determine the source of the image.
  /// 
  Image({
    required this.src,
    this.alt,
    this.width,
    this.height,
    super.className,
    super.children,
    super.id,
    super.attributes,
    super.style,
    this.onLoad,
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
  }) : super(
          tag: "img",
        );

  @override
  HTMLImageElement render() {
    final element = super.render() as HTMLImageElement;
    element.setAttribute("src", src);
    if (alt != null) element.setAttribute("alt", alt!);
    if (width != null) {
      element.setAttribute("width", width!);
    }
    if (height != null) {
      element.setAttribute("height", height!);
    }
    return element;
  }
}
