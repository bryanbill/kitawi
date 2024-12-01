import 'package:kitawi/kitawi.dart';

class Form extends Component {
  final String? action;
  final String? method;
  Form({
    required super.children,
    this.action,
    this.method,
    super.onSubmit,
    super.tag = "form",
    super.id,
    super.style,
    super.className,
    super.attributes,
  });

  @override
  Element render() {
    final form = super.render() as HTMLFormElement;
    if (action != null) form.action = action!;
    if (method != null) form.method = method!;
    if (onSubmit != null) {
      form.onSubmit.listen((event) {
        onSubmit!(event);
      });
    }
    return form;
  }
}
