import 'dart:html';

import 'package:kitawi/src/core/edge_insets.dart';
import 'package:kitawi/src/core/foundation.dart';
import 'package:kitawi/src/core/key.dart';
import 'package:kitawi/src/core/widget.dart';

/// The [Container] class is a widget that creates a div element with the defined props.
class Container extends Widget {
  final Widget? child;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Decoration? decoration;
  final Alignment? alignment;
  final BoxConstraints? constraints;

  Container(
      {Key? key,
      this.child,
      this.width,
      this.height,
      this.padding,
      this.margin,
      this.decoration,
      this.alignment,
      this.constraints})
      : super(key: key);

  @override
  Element createElement() {
    return DivElement()
      ..id = key?.value ?? ''
      ..style.width = width != null ? '${width}px' : '100%'
      ..style.height = height != null ? '${height}px' : '100%'
      ..style.maxHeight = constraints?.maxHeight != null
          ? '${constraints?.maxHeight}px'
          : 'auto'
      ..style.maxWidth =
          constraints?.maxWidth != null ? '${constraints?.maxWidth}px' : 'auto'
      ..style.minHeight = constraints?.minHeight != null
          ? '${constraints?.minHeight}px'
          : 'auto'
      ..style.minWidth =
          constraints?.minWidth != null ? '${constraints?.minWidth}px' : 'auto'
      ..style.padding = padding?.toString() ?? 'auto'
      ..style.margin = margin?.toString() ?? 'auto'
      ..style.backgroundColor = decoration?.color?.rgba ?? 'auto'
      ..style.borderRadius = '${decoration?.border?.borderRadius ?? 0}px'
      ..style.border =
          '${decoration?.border?.width ?? 0}px solid ${decoration?.border?.color?.rgba}'
      ..style.boxShadow =
          decoration?.boxShadow?.map((e) => e.toString()).join(', ') ?? "auto"
      ..style.display = 'flex'
      ..style.justifyContent = alignment?.x ?? 'auto'
      ..style.alignItems = alignment?.y ?? 'auto'
      ..children.add(child?.createElement() ?? DivElement());
  }
}
