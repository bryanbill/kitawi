import 'package:kitawi/kitawi.dart';

extension Find on Component {
  void show([String? display]) {
    element?.style.display = display ?? 'block';
  }

  void hide() {
    element?.style.display = 'none';
  }

  void toggle([String? display]) {
    element?.style.display =
        element?.style.display == 'none' ? display ?? 'block' : 'none';
  }

  void addClass(String className) {
    element?.classList.add(className);
  }

  void removeClass(String className) {
    element?.classList.remove(className);
  }

  void toggleClass(String className) {
    element?.classList.toggle(className);
  }

  void hasClass(String className) {
    element?.classList.contains(className);
  }

  String? attr(String name, [String? value]) {
    if (value == null) {
      return element?.getAttribute(name);
    }
    element?.setAttribute(name, value);
    return value;
  }

  void removeAtptr(String name) {
    element?.removeAttribute(name);
  }
}

/// Find an element by its selector
Component find(String selector) {
  try {
    return stack.where((c) {
      if (c.element == null) {
        return false;
      }

      if (selector.startsWith("#")) {
        return c.element!.id == selector.substring(1);
      }

      if (selector.startsWith(".")) {
        return c.element!.classList.contains(selector.substring(1));
      }

      return c.element!.tagName.toLowerCase() == selector.toLowerCase();
    }).first;
  } catch (err) {
    throw Exception('Component with selector $selector not found');
  }
}
