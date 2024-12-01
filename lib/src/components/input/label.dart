import 'package:kitawi/kitawi.dart';

class Label extends Component {
  final String? forId;

  Label({
    required super.children,
    this.forId,
    super.tag = "label",
    super.id,
    super.style,
    super.className,
  });

  @override
  Element render() {
    final label = super.render() as HTMLLabelElement;
    if (forId != null) label.htmlFor = forId!;
    return label;
  }
}
