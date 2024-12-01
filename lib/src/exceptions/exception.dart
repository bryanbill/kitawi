abstract class Exception extends Error {
  final String message;
  final String type;

  @override
  final StackTrace? stackTrace;
  Exception(this.message, this.type, [this.stackTrace]);

  /// In Debug mode, shows the exception message as a dialog.
  void show() {
    throw UnimplementedError();
  }

  @override
  String toString() {
    return '$type: $message \n$stackTrace';
  }
}
