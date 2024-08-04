import 'package:kitawi/kitawi.dart';

class Option {
  final String value;
  final Component child;

  Option({required this.value, required this.child});
}

class Select extends Component {
  final List<Option> options;

  final void Function(String)? onSelect;

  final String? defaultValue;
  Select({
    super.id,
    super.attributes,
    super.style,
    super.className,
    this.onSelect,
    this.defaultValue,
    this.options = const [],
  }) : super(tag: 'select');

  @override
  HTMLSelectElement render() {
    final element = super.render() as HTMLSelectElement;

    for (final option in options) {
      final optionElement = HTMLOptionElement()
        ..value = option.value
        ..appendChild(option.child.render());

      if (option.value == defaultValue) {
        optionElement.selected = true;
      }

      element.append(optionElement);
    }

    if (onSelect != null) {
      element.onChange.listen((event) {
        onSelect!(element.value);
      });
    }

    return element;
  }
}
