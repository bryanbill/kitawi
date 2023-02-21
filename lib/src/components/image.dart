import 'dart:html';

import 'package:kitawi/src/basic.dart';

class Image extends Widget {
  final String src;
  final double? width;
  final double? height;
  final double? padding;
  final double? margin;
  final Decoration? decoration;
  final Alignment? alignment;
  final BoxFit? fit;

  Image(this.src,
      {this.width,
      this.height,
      this.padding,
      this.margin,
      this.decoration,
      this.alignment,
      this.fit});

  @override
  Element createElement() {
    return ImageElement(
        src: src, width: width?.toInt(), height: height?.toInt())
      ..style.width = width != null ? '${width}px' : '100%'
      ..style.height = height != null ? '${height}px' : '100%'
      ..style.maxWidth = width != null ? '${width}px' : '100%'
      ..style.padding = '${padding ?? 0}px'
      ..style.margin = '${margin ?? 0}px'
      ..style.backgroundColor = decoration?.color?.rgba ?? 'inherit'
      ..style.borderRadius = '${decoration?.border?.borderRadius ?? 0}px'
      ..style.border =
          '${decoration?.border?.width ?? 0}px solid ${decoration?.border?.color?.rgba}'
      ..style.boxShadow =
          decoration?.boxShadow?.map((e) => e.toString()).join(', ') ??
              "inherit"
      ..style.display = 'flex'
      ..style.justifyContent = alignment?.x ?? 'inherit'
      ..style.alignItems = alignment?.y ?? 'inherit'
      ..style.objectFit = fit?.toString() ?? 'inherit';
  }
}
