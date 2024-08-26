import 'package:kitawi/kitawi.dart';

class Label extends Component {
  Label({
    required super.children,
    super.tag = "label",
    super.id,
    super.style,
    super.className,
  });

  @override
  Element render() {
    final label = super.render() as HTMLLabelElement;

    return label;
  }
}
