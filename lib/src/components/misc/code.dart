import 'package:kitawi/kitawi.dart';

class Code extends Component {
  final String code;

  Code(
    this.code, {
    super.id,
    super.attributes,
    super.style,
    super.className,
  });

  @override
  HTMLElement render() {
    final element = super.render() as HTMLElement;
    element.text = code;

    return element;
  }
}

class Pre extends Component {
  Pre({
    super.id,
    super.attributes,
    super.style,
    super.className,
    required super.children,
  });

  @override
  HTMLElement render() {
    final element = super.render() as HTMLElement;
    element.style.whiteSpace = 'pre-wrap';

    for (final child in children!) {
      element.append(child.render());
    }

    return element;
  }
}
