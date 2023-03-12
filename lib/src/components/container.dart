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
  final Gradient? gradient;

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
    this.gradient,
  }) : super(key: key);

  @override
  Element createElement() {
    

    final div = DivElement()
      ..id = key?.value ?? ''
      ..style.maxHeight = '${constraints?.maxHeight}'
      ..style.maxWidth = '${constraints?.maxWidth}'
      ..style.minHeight = '${constraints?.minHeight}'
      ..style.minWidth = '${constraints?.minWidth}'
      ..style.padding = padding?.toString()
      ..style.margin = margin?.toString()
      ..style.backgroundColor = decoration?.color?.rgba
      ..style.borderRadius = decoration?.borderRadius?.toString() ?? '0'
      ..style.borderColor = decoration?.border?.color?.rgba
      ..style.borderWidth = '${decoration?.border?.side}'
      ..style.borderStyle = decoration?.border?.type?.toString().split(".").last
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
      div.style.width =
          '${Dimensions.calc(from: width!, inset: Dimensions.of(paddingLeft + paddingRight))}';
      div.style.height =
          '${Dimensions.calc(from: width!, inset: Dimensions.of(paddingTop + paddingBottom))}';
    } else {
      div.style.width = width.toString();
      div.style.height = height.toString();
    }
    return div;
  }
}
