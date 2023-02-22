import 'dart:html';

import 'package:kitawi/src/basic.dart';

/// A function that can be called to update the state of a widget.
typedef StateSetter = void Function(VoidCallback fn);

/// A function that updates the state of a widget.
typedef VoidCallback = void Function();

/// A widget that can hold state and rebuild itself when the state changes.
///
/// This widget is used as the base class for all widgets that need to hold
/// state. It provides a `setState` method that can be used to update the state
/// of the widget and trigger a rebuild.
/// A widget that can hold state and rebuild itself when the state changes.
///
/// This widget is used as the base class for all widgets that need to hold
/// state. It provides a `createState` method that can be used to create the
/// widget's state, and a `build` method that is called when the state of the
/// widget or its dependencies changes.
abstract class StatefulWidget extends Widget {
  State? _state;

  State createState();

  @override
  Element render() {
    _state ??= createState();
    _state!.widget = this;
    return _state!.build().render();
  }

  @override
  void build() {
    _state?.build();
  }
}

/// A widget state that can be updated and used to rebuild the widget.
///
/// This widget state is used as the base class for all state objects that are
/// created by a [StatefulWidget]. It provides a `setState` method that can be
/// used to update the state of the widget and trigger a rebuild.
abstract class State<T extends StatefulWidget> {
  T? _widget;

  /// The widget that owns this state.
  T get widget => _widget!;

  set widget(T value) {
    assert(_widget == null);
    _widget = value;
  }

  /// The [initState] method is called when the state is created.
  void initState() {}

  /// The [didChangeDependencies] method is called when the state's dependencies
  /// change.
  void didChangeDependencies() {}

  /// The [dispose] method is called when the state is removed from the tree.
  /// It is used to dispose of any resources that the state is using.
  void dispose() {}

  /// The [setState] method is called to update the state of the widget.
  /// It calls the [build] method to rebuild the widget.
  void setState(VoidCallback fn) {
    fn();
    _widget?.build();
  }

  /// The [build] method is called when the state of the widget changes.
  Widget build();
}
