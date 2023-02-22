import 'change_notifier.dart';

class ValueNotifier<T> extends ChangeNotifier {
  ValueNotifier(this._value);

  T get value => _value;
  set value(T newValue) {
    if (_value == newValue) return;
    _value = newValue;
    notifyListeners();
  }

  T _value;

  @override
  String toString() => 'ValueNotifier($value)';
}
