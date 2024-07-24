class Ref<T> {
  T? element;

  /// Create a new Ref instance.
  Ref() {
    this.element = null;
  }

  void set(element) {
    if (element is T) {
      this.element = element;
    } else {
      throw Exception('Invalid element type');
    }

    this.element = element;
  }
}
