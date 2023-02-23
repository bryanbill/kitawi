import 'dart:async';

/// A [ValueStream] is a [Stream] that wraps a single value.

class ValueStream<T> {
  late StreamController<T> _controller;
  T _value;

  ValueStream(this._value) {
    _controller = StreamController<T>.broadcast();
  }

  /// The [stream] getter returns the stream of the [ValueStream].

  Stream<T> get stream => _controller.stream;

  T get value => _value;

  set value(T newValue) {
    _value = newValue;
    _controller.add(newValue);
  }

  void dispose() {
    _controller.close();
  }
}
