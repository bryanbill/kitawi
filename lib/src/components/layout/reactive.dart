import 'package:kitawi/kitawi.dart';

class Reactive<T> extends Component {
  final Stream<T> stream;
  final T? initial;
  final Component Function(T) builder;

  Reactive({
    required this.stream,
    required this.builder,
    this.initial,
    super.id,
    super.attributes,
    super.style,
    super.className,
  }) : super(tag: 'div');

  @override
  HTMLElement render() {
    final element = super.render() as HTMLElement;
    stream.listen((data) {
      clear();
      element.append(builder(data).render());
    });

    if (initial != null && initial is T) {
      element.append(builder(initial as T).render());
    }

    return element;
  }
}
