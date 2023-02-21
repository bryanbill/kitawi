import 'dart:html';

/// The [Action] class is used to handle the events of the [Widget]s.
///
/// The [Action] class is used to handle the events of the [Widget]s. It takes
/// the type of the event and the [onClick] function as arguments.
///
class Action {
  final String type;
  final void Function(Event)? onClick;

  Action({required this.type, this.onClick});
}
