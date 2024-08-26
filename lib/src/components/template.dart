import 'package:kitawi/kitawi.dart' show Component, HTMLElement, Context, stack;

abstract class Template extends Component {
  Template({
    super.id,
    super.attributes,
    super.style,
    super.className,
    super.tag = 'div',
  });

  Context get context => Context(stack.indexOf(this), this);

  Component build(Context context);

  void onRender() {}

  void onDispose() {}

  @override
  HTMLElement render() {
    onStackChange.stream.listen((event) {
      if (event.$1 == 'add' && event.$2 == this) {
        onRender();
      }

      if (event.$1 == 'remove' && event.$2 == this) {
        onDispose();
      }
    });

    final templateWrapper = super.render() as HTMLElement;

    final context = Context(stack.indexOf(this), this);
    templateWrapper.appendChild(build(context).render());

    return templateWrapper;
  }
}
