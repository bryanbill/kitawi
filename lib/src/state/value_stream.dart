import 'dart:async';

class ValueStream<T> {
  StreamController<T>? _controller;
  T _value;

  ValueStream(this._value) {
    _controller = StreamController<T>.broadcast();
  }

  Stream<T>? get stream => _controller?.stream;

  T get value => _value;

  set value(T newValue) {
    _value = newValue;
    _controller?.add(newValue);
  }

  void dispose() {
    _controller?.close();
  }
}
