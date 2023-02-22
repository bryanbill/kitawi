import 'dart:html';

/// The [Action] class is used to handle the events of the [Widget]s.
///
/// The [Action] class is used to handle the events of the [Widget]s. It takes
/// the type of the event and the [callback] function as arguments.
///
class Action {
  /// The type of the event. It can be 'click', 'mouseover', 'mouseout', etc.
  final String type;

  /// The [callback] function is called when the event is triggered.
  final void Function(Event) callback;

  Action({required this.type, required this.callback});
}
