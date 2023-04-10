import 'dart:html';
import 'dart:math';

import 'package:kitawi/widgets.dart';

class LinearProgressIndicator extends Widget {
  final double? value;
  final Color? backgroundColor;
  final Color? valueColor;
  final double? height;
  final BorderRadius? borderRadius;

  LinearProgressIndicator({
    Key? key,
    this.value,
    this.backgroundColor,
    this.valueColor,
    this.height,
    this.borderRadius,
  });
  @override
  Element createElement() {
    key ??= Key('progress-indicator-${Random.secure().nextInt(100)}');
    String css = """
  #$key::-webkit-progress-bar {
    background-color: ${backgroundColor?.rgba ?? 'transparent'};
  }

  #$key::-webkit-progress-value {
    background-color: ${valueColor?.rgba ?? 'transparent'};
  }

  #$key::-moz-progress-bar {
    background-color: ${valueColor?.rgba ?? 'transparent'};
  }

""";

    var style = StyleElement()..text = css;
    document.head!.children.add(style);

    return ProgressElement()
      ..id = key!.value
      ..style.width = '100%'
      ..style.height = '${height ?? 5}px'
      ..style.color = backgroundColor?.rgba ?? 'transparent'
      ..style.borderRadius = borderRadius?.toString() ?? '0'
      ..style.overflow = 'hidden'
      ..style.justifyContent = 'center'
      ..style.boxShadow = '0 0 5px 0 rgba(0, 0, 0, 0.1)'
      ..style.transition = 'all 0.3s ease-in-out'
      ..value = value ?? 0
      ..max = 100
      ..style.backgroundColor = valueColor?.rgba ?? 'transparent';
  }
}
