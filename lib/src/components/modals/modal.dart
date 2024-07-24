import 'package:kitawi/kitawi.dart';

class Modal extends Component {
  final Component? title;
  final Component? body;
  final List<Component>? actions;
  final bool? dismissible;

  /// Modal component. Use the [showModal] function to display the modal.
  Modal({
    this.title,
    this.body,
    this.actions,
    this.dismissible,
    super.style,
    super.tag = 'div',
    super.className,
  });

  @override
  Element render() {
    var modalContainer = super.render() as HTMLDivElement;
    modalContainer.style
      ..position = 'fixed'
      ..top = '0'
      ..left = '0'
      ..width = '100%'
      ..height = '100%'
      ..backgroundColor = 'rgba(0, 0, 0, 0.5)'
      ..display = 'flex'
      ..justifyContent = 'center'
      ..alignItems = 'center'
      ..zIndex = '1000';

    modalContainer.onClick.listen((event) {
      event.stopPropagation();
      if (dismissible == true) {
        modalContainer.remove();
      }
    });

    var modal = Div(
      className: className,
      children: [
        if (title != null) title!,
        if (body != null) body!,
        if (actions != null)
          Div(
            style: {
              'display': 'flex',
              'justifyContent': 'flex-end',
              'marginTop': '20px',
            },
            children: actions!,
          ),
      ],
    );

    modalContainer.append(modal.render());
    return modalContainer;
  }
}

/// Displays a modal with the specified components.
Modal showModal({
  required Component title,
  Component? body,
  List<Component>? actions,
  String? className,
  Map<String, String>? style,
  bool? dismissible = true,
}) {
  var modal = Modal(
    title: title,
    body: body,
    actions: actions,
    className: className,
    style: style,
    dismissible: dismissible,
  );

  document.body!.appendChild(modal.render());
  return modal;
}
