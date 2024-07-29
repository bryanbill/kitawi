import 'package:kitawi/kitawi.dart';

class Radio extends Component {
  final bool value;
  final void Function(bool)? onChanged;
  final String? name;
  Radio({
    this.value = false,
    this.onChanged,
    super.tag = "input",
    super.attributes = const {
      "type": "radio",
    },
    this.name,
    super.id,
    super.style,
    super.className,
  });

  @override
  HTMLInputElement render() {
    final input = super.render() as HTMLInputElement;
    input.checked = value;
    input.onChange.listen((event) {
      onChanged?.call(input.checked);
    });

    return input;
  }
}
