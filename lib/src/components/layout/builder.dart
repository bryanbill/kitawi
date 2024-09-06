import 'package:kitawi/kitawi.dart';

class Context {
  final int index;
  final Component component;

  Context(this.index, this.component);

  void remove() {
    component.remove();
  }

  void update() {
    component.update();
  }

  void append(Component child) {
    component.append(child);
  }
}

class Builder extends Component {
  final Component Function(Context) builder;

  Builder({
    required this.builder,
    super.id,
    super.attributes,
    super.style,
    super.className,
  }) : super(tag: 'div');

  @override
  HTMLElement render() {
    final element = super.render() as HTMLElement;
    final index = stack.indexOf(this);
    element.appendChild(builder(Context(index, this)).render());
    return element;
  }
}
