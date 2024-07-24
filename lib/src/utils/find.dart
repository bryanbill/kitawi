import 'package:kitawi/kitawi.dart';

extension Find on HTMLElement {
  void show() {
    style.display = 'block';
  }

  void hide() {
    style.display = 'none';
  }

  void toggle() {
    style.display = style.display == 'none' ? 'block' : 'none';
  }

  void addClass(String className) {
    classList.add(className);
  }

  void removeClass(String className) {
    classList.remove(className);
  }

  void toggleClass(String className) {
    classList.toggle(className);
  }

  void hasClass(String className) {
    classList.contains(className);
  }

  String? attr(String name, [String? value]) {
    if (value == null) {
      return getAttribute(name);
    }
    setAttribute(name, value);
    return value;
  }
}

/// Find an element by its selector
HTMLElement find(String selector) {
  try {
    return document.querySelector(selector)! as HTMLElement;
  } catch (err) {
    throw Exception('Element not found');
  }
}
