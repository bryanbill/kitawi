import 'dart:html';

class Action {
  final String type;
  final void Function(Event) onClick;

  Action({required this.type, required this.onClick});
}
