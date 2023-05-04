import 'dart:html';

/// The [Action] class is used to handle the events of the [Widget]s.
///
/// The [Action] class is used to handle the events of the [Widget]s. It takes
/// the type of the event and the [callback] function as arguments.
///
class Action {
  /// The type of the event. It can be 'click', 'mouseover', 'mouseout', etc.
  final Actions type;

  /// The [callback] function is called when the event is triggered.
  final void Function(Event) callback;

  Action(
    this.callback, {
    required this.type,
  });
}

enum Actions {
  click,
  mouseover,
  mouseout,
  mousemove,
  mouseenter,
  mouseleave,
  mouseup,
  mousedown,
  keydown,
  keyup,
  keypress,
  focus,
  blur,
  change,
  submit,
  reset,
  select,
  contextmenu,
  dblclick,
  drag,
  dragend,
  dragenter,
  dragleave,
  dragover,
  dragstart,
  drop,
  input,
  invalid,
  load,
  resize,
  scroll,
  unload,
  abort,
  canplay,
  canplaythrough,
  durationchange,
  emptied,
  ended,
  error,
  loadeddata,
  loadedmetadata,
  loadstart,
  pause,
  play,
  playing,
  progress,
  ratechange,
  seeked,
  seeking,
  stalled,
  suspend,
  timeupdate,
  volumechange,
  waiting,
  copy,
  cut,
  paste,
}
