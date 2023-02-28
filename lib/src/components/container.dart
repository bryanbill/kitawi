import 'dart:html';

import 'package:kitawi/src/core/edge_insets.dart';
import 'package:kitawi/src/core/foundation.dart';
import 'package:kitawi/src/core/key.dart';
import 'package:kitawi/src/core/widget.dart';
import 'package:kitawi/src/types/dimensions.dart';

/// The [Container] class is a widget that creates a div element with the defined props.
class Container extends Widget {
  final Widget? child;
  final Dimensions? width;
  final Dimensions? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Decoration? decoration;
  final Alignment? alignment;
  final BoxConstraints? constraints;

  Container({
    Key? key,
    this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.decoration,
    this.alignment,
    this.constraints,
  }) : super(key: key);

  @override
  Element createElement() {
    final div = DivElement()
      ..id = key?.value ?? ''
      ..style.maxHeight =
          constraints?.maxHeight != null ? '${constraints?.maxHeight}' : 'auto'
      ..style.maxWidth =
          constraints?.maxWidth != null ? '${constraints?.maxWidth}' : 'auto'
      ..style.minHeight =
          constraints?.minHeight != null ? '${constraints?.minHeight}' : 'auto'
      ..style.minWidth =
          constraints?.minWidth != null ? '${constraints?.minWidth}' : 'auto'
      ..style.padding = padding?.toString() ?? 'auto'
      ..style.margin = margin?.toString() ?? 'auto'
      ..style.backgroundColor = decoration?.color?.rgba ?? 'auto'
      ..style.borderRadius = decoration?.borderRadius?.toString() ?? 'inherit'
      ..style.borderColor = decoration?.border?.color?.rgba ?? 'auto'
      ..style.borderWidth = decoration?.border?.side != null
          ? '${decoration?.border?.side}'
          : 'auto'
      ..style.borderStyle =
          decoration?.border?.type?.toString().split(".").last ?? 'auto'
      ..style.boxShadow =
          decoration?.boxShadow?.map((e) => e.toString()).join(', ') ?? "auto"
      ..style.display = 'flex'
      ..style.justifyContent = alignment?.x ?? 'auto'
      ..style.alignItems = alignment?.y ?? 'auto'
      ..children.add(child?.createElement() ?? DivElement());

    if (padding != null) {
      var paddingLeft = padding?.left ?? 0;
      var paddingRight = padding?.right ?? 0;
      var paddingTop = padding?.top ?? 0;
      var paddingBottom = padding?.bottom ?? 0;
      div.style.width = width != null
          ? '${Dimensions.calc(from: width!, inset: Dimensions.of(paddingLeft + paddingRight))}'
          : 'auto';
      div.style.height = height != null
          ? '${Dimensions.calc(from: width!, inset: Dimensions.of(paddingTop + paddingBottom))}'
          : 'auto';
    } else {
      div.style.width = width != null ? '$width' : 'auto';
      div.style.height = height != null ? '$height' : 'auto';
    }
    return div;
  }
}
