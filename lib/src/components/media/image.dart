import 'dart:html';

import 'package:kitawi/src/basic.dart';

/// The [Image] class is a widget that displays an image.

class Image extends Widget {
  /// Creates a new [Image] widget with the given parameters.
  /// The [src] parameter is required and specifies the source of the image.
  final String src;

  /// The [width] parameter is optional and specifies the width of the image.
  final double? width;

  /// The [height] parameter is optional and specifies the height of the image.
  final double? height;

  /// The [EdgeInsets] `padding` parameter is optional and specifies the padding of the image.
  final EdgeInsets? padding;

  /// The [EdgeInsets] `margin` parameter is optional and specifies the margin of the image.
  final EdgeInsets? margin;

  /// The [Decoration] `decoration` parameter is optional and specifies the decoration of the image.
  final Decoration? decoration;

  /// The [Alignment] `alignment` parameter is optional and specifies the alignment of the image.
  final Alignment? alignment;

  /// The [BoxFit] `fit` parameter is optional and specifies the fit of the image.
  final BoxFit? fit;

  /// The [Action]s to be performed on the image.
  final List<Action>? actions;

  /// The alternative widget to be displayed if an error occurs while loading the image.
  /// This is optional and defaults to a [Text] widget with the text "Image not found".
  Widget Function(StackTrace? stackTrace)? errorWidget;

  Image(
    this.src, {
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.decoration,
    this.alignment,
    this.fit,
    this.errorWidget,
    this.actions,
  });

  /// The [createElement] method creates the [ImageElement] for the widget.

  @override
  Element createElement() {
    var imageElement =
        ImageElement(src: src, width: width?.toInt(), height: height?.toInt())
          ..style.width = width != null ? '${width}px' : '100%'
          ..style.height = height != null ? '${height}px' : '100%'
          ..style.maxWidth = width != null ? '${width}px' : '100%'
          ..style.padding = '${padding ?? 0}px'
          ..style.margin = '${margin ?? 0}px'
          ..style.backgroundColor = decoration?.color?.rgba ?? 'inherit'
          ..style.borderRadius =
              decoration?.borderRadius?.toString() ?? 'inherit'
          ..style.borderWidth = '${decoration?.border?.side ?? 0}'
          ..style.borderColor = decoration?.border?.color?.rgba ?? 'inherit'
          ..style.borderStyle = decoration?.border?.type?.toString() ?? 'solid'
          ..style.boxShadow =
              decoration?.boxShadow?.map((e) => e.toString()).join(', ') ??
                  "inherit"
          ..style.display = 'flex'
          ..style.justifyContent = alignment?.x ?? 'inherit'
          ..style.alignItems = alignment?.y ?? 'inherit'
          ..style.objectFit = fit?.toString() ?? 'inherit'
          ..alt = src;
    actions?.removeWhere(
        (action) => action.type == null || action.callback == null);
    for (var action in actions ?? <Action>[]) {
      imageElement.on[action.type!].listen(action.callback!);
    }
    imageElement.onError.listen((event) {
      var parent = imageElement.parent;
      imageElement.remove();
      // get the error message
      parent?.children.add(errorWidget
              ?.call(StackTrace.fromString("Failed to load image: $src"))
              .render() ??
          Text('Image not found').render());
    });
    return imageElement;
  }
}
