import 'package:kitawi/kitawi.dart';

/// Base class for all media types (image, video, audio, etc.)
abstract class Media extends Component {
  /// Base class for all media types (image, video, audio, etc.)
  Media({
    required this.src,
    this.fallback,
    this.poster,
    this.alt,
    this.width,
    this.height,
    this.onLoad,
    this.onError,
    this.onAbort,
    super.tag,
    super.className,
    super.children,
    super.id,
    super.attributes,
    super.style,
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
  });

  /// The source of the media. If the browser supports the media type, it will be displayed, otherwise the optional [fallback] will be used.
  final String src;

  /// Optional fallback for the media source.
  final List<String>? fallback;

  /// The poster of the media if it is a video.
  final String? poster;

  /// The alternative text for the media.
  final String? alt;

  /// The width of the media.
  final String? width;

  /// The height of the media.
  final String? height;

  /// The function to call when the media is loaded.
  final void Function(Event)? onLoad;

  /// The function to call when the media fails to load.
  final void Function(Event)? onError;

  /// The function to call when the media is aborted.
  final void Function(Event)? onAbort;

  @override
  Element render() {
    final element = super.render();
    element.setAttribute('src', src);
    if (poster != null) element.setAttribute('poster', poster!);
    if (alt != null) element.setAttribute('alt', alt!);
    if (width != null) element.setAttribute('width', width!);
    if (height != null) element.setAttribute('height', height!);
    if (onLoad != null) element.onLoad.listen((event) => onLoad!(event));
    if (onError != null) element.onError.listen((event) => onError!(event));
    if (onAbort != null) element.onAbort.listen((event) => onAbort!(event));

    return element;
  }
}

enum MediaState {
  /// The media is paused.
  paused,

  /// The media is playing.
  playing,

  /// The media has ended.
  ended,
}

enum MediaControl {
  nodownload,
  noremoteplayback,
  nofullscreen,
}
