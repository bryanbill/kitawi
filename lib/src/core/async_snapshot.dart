/// A snapshot of asynchronous interaction with a [Stream] or a [Future].
class AsynSnapshot<T> {
  final T? data;
  final Object? error;
  final StackTrace? stackTrace;
  final bool hasData;
  final bool hasError;

  /// Creates a new [AsynSnapshot] instance.
  AsynSnapshot({
    this.data,
    this.error,
    this.stackTrace,
    this.hasData = false,
    this.hasError = false,
  });
}
