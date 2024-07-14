import 'package:web/web.dart';

import 'components/component.dart';

/// Determines the debug mode of the library.
bool DEBUG = false;

class App {
  final bool? debug;
  final String? target;
  final List<Component>? children;

  App({
    this.debug,
    this.target = "#output",
    this.children,
  });

  void render() {
    if (debug != null) {
      DEBUG = debug!;
    }

    if (target != null) {
      final element = document.querySelector(target!);
      if (element == null) {
        throw Exception('Element with id $target not found');
      }

      if (children != null) {
        for (final child in children!) {
          element.append(child.render());
        }
      }
    }
  }
}
