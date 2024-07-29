import 'package:kitawi/kitawi.dart';

class Label extends Component {
  final Component child;
  Label(
      {required this.child,
      super.tag = "label",
      super.id,
      super.style,
      super.className});

  @override
  Element render() {
    final label = super.render() as HTMLLabelElement;
    label.append(child.render());
    return label;
  }
}
