import 'dart:html';

import 'package:kitawi/kitawi.dart';

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
      if (width != null) {
        div.style.width =
            '${Dimensions.calc(from: width!, inset: Dimensions.of(paddingLeft + paddingRight))}';
      }
      if (height != null) {
        div.style.height =
            '${Dimensions.calc(from: height!, inset: Dimensions.of(paddingTop + paddingBottom))}';
      }
    } else {
      div.style.width = width.toString();
      div.style.height = height.toString();
    }
    if (decoration?.gradient != null) {
      div.style.backgroundImage = decoration?.gradient?.toString();
    }

    if (decoration?.image != null) {
      div.style.background = decoration?.image?.toString();
    }

    return div;
  }
}
