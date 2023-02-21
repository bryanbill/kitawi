import 'dart:html';

class Key {
  final String _key;
  Key(this._key);

  String get value => _key;

  Element? get get => document.getElementById(value);
}
