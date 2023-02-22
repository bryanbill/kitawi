import 'dart:html';

/// The [ChangeNotifier] class is used to notify the listeners when the state
/// changes.
class ChangeNotifier {
  /// The [_listeners] list contains the list of listeners.
  final List<VoidCallback> _listeners = <VoidCallback>[];

  /// The [addListener] method adds the [listener] to the [_listeners] list.
  /// The [listener] is called when the state changes.
  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  /// The [removeListener] method removes the [listener] from the [_listeners]
  /// list.
  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }

  /// The [dispose] method removes all the listeners from the [_listeners] list.
  /// It is called when the widget is removed from the tree.
  void dispose() {
    _listeners.clear();
  }

  /// The [notifyListeners] method notifies the listeners when the state changes.
  /// It is called when the state changes.
  /// It calls the [listener] function for each listener in the [_listeners] list.

  void notifyListeners() {
    for (final listener in _listeners) {
      listener();
    }
  }
}
