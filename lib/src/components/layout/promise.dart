import 'package:kitawi/kitawi.dart';

class Promise<T> extends Component {
  final Future<T> promise;
  final Component Function(T) onResolve;
  final Component Function(Object)? onReject;
  final Component? loading;

  Promise({
    required this.promise,
    required this.onResolve,
    this.loading,
    this.onReject,
    super.id,
    super.attributes,
    super.style,
    super.className,
  }) : super(tag: 'div');

  @override
  HTMLElement render() {
    final element = super.render() as HTMLElement;

    if (loading != null) {
      element.append(loading!.render());
    }

    promise.then((value) {
      clear();
      element.append(onResolve(value).render());
    }).catchError((
      error,
    ) {
      if (onReject != null) {
        clear();
        element.append(onReject!(error).render());
      }
    });

    return element;
  }
}
