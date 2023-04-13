import 'dart:async';

/// A [ValueStream] is a wrapper around a [StreamController] that allows
/// [T] values to be streamed.
/// The [T] type parameter represents the type of the value that is being
/// streamed.
class ValueStream<T> {
  final _controller = StreamController<T?>.broadcast();
  T? _value;

  ValueStream(this._value);

  /// The [stream] getter returns the stream of the [ValueStream].
  Stream<T?> get stream => _controller.stream;

  T? get value => _value;

  set value(T? newValue) {
    _value = newValue;
    _controller.add(newValue);
  }

  void add(T? newValue) {
    _value = newValue;
    _controller.add(newValue);
  }

  void dispose() {
    _controller.close();
  }
}
