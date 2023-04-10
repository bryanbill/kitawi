import 'dart:html';

import 'package:kitawi/widgets.dart';

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
      ..style.padding = "$padding"
      ..style.margin = "$margin"
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

    var horizontalInset = 0.0;
    var verticalInset = 0.0;
    if (padding != null) {
      horizontalInset += (padding?.left ?? 0) + (padding?.right ?? 0);
      verticalInset += (padding?.top ?? 0) + (padding?.bottom ?? 0);
    }
    if (margin != null) {
      horizontalInset += (margin?.left ?? 0) + (margin?.right ?? 0);
      verticalInset += (margin?.top ?? 0) + (margin?.bottom ?? 0);
    }

    div.style.width = width != null
        ? '${Dimensions.calc(from: width!, inset: Dimensions.of(horizontalInset))}'
        : div.style.width;
    div.style.height = height != null
        ? '${Dimensions.calc(from: height!, inset: Dimensions.of(verticalInset))}'
        : div.style.height;

    if (decoration?.gradient != null) {
      div.style.backgroundImage = decoration?.gradient?.toString();
    }

    if (decoration?.image != null) {
      div.style.background = decoration?.image?.toString();
    }

    return div;
  }
}
