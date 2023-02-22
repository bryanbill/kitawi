import 'dart:html';

class ChangeNotifier {
  final List<VoidCallback> _listeners = <VoidCallback>[];

  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }

  void dispose() {
    _listeners.clear();
  }

  void notifyListeners() {
    for (final listener in _listeners) {
      listener();
    }
  }
}
