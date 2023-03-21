import 'dart:html';

/// The [Key] class is used to get the [Element] from the DOM.
/// Each [Widget] has a [Key] which is used to get the [Element] from the DOM.
/// The [Key] class takes a [String] as an argument.
class Key {
  final String _key;
  Key(this._key);

  /// Returns the [String] value of the [Key].
  String get value => _key;

  /// Returns the [Element] from the DOM.
  Element? get get => document.getElementById(value);

  @override
  String toString() => _key;
}
