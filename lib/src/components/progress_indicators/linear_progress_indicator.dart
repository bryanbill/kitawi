import 'dart:html';

import 'package:kitawi/src/basic.dart';

class LinearProgressIndicator extends Widget {
  final double? value;
  final Color? backgroundColor;
  final Color? valueColor;
  final double? height;
  final BorderRadius? borderRadius;

  LinearProgressIndicator({
    this.value,
    this.backgroundColor,
    this.valueColor,
    this.height,
    this.borderRadius,
  });
  @override
  Element createElement() {
    String id = 'progress-indicator-${DateTime.now().millisecondsSinceEpoch}';
    String css = """
  #$id::-webkit-progress-bar {
    background-color: ${backgroundColor?.rgba ?? 'transparent'};
  }
  
  #$id::-webkit-progress-value {
    background-color: ${valueColor?.rgba ?? 'transparent'};
  }
  
  #$id::-moz-progress-bar {
    background-color: ${valueColor?.rgba ?? 'transparent'};
  }

""";

    var style = StyleElement()..text = css;
    document.head!.children.add(style);

    return ProgressElement()
      ..id = id
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
