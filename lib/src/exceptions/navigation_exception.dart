import 'exception.dart';

class NavigationException extends Exception {
  NavigationException(String message, [StackTrace? stackTrace])
      : super(message, 'NavigationException', stackTrace);
}
