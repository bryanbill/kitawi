abstract class Error {
  final String name;
  final String message;
  final StackTrace? stackTrace;

  Error(this.name, this.message, this.stackTrace);

  @override
  String toString() {
    return "name: $name, message: $message\n$stackTrace";
  }
}

class ElementNotFoundError extends Error {
  ElementNotFoundError(String message,{ StackTrace? stackTrace})
      : super("ElementNotFoundError", message, stackTrace);
}
