import 'package:kitawi/kitawi.dart';

class Modal extends Component {
  final Component? title;
  Component? body;
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
  Component? title,
  Component Function(Modal)? builder,
  List<Component>? actions,
  String? className,
  Map<String, String>? style,
  bool? dismissible = true,
}) {
  var modal = Modal(
    title: title,
    actions: actions,
    className: className,
    style: style,
    dismissible: dismissible,
  );

  if (builder != null) modal.body = builder(modal);

  document.querySelector("#app")!.appendChild(modal.render());
  return modal;
}
