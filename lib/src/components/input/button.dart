import 'package:kitawi/kitawi.dart';

class Button extends Component {
  final Component? child;
  Button({
    super.id,
    super.attributes,
    super.style,
    super.className,
    this.child,
    // @Deprecated('Use child instead') 
    super.children,
    super.onClick,
    super.onDoubleClick,
    super.onContextMenu,
    super.onKeyDown,
    super.onKeyPress,
    super.onKeyUp,
    super.onMouseOver,
    super.onMouseOut,
    super.onMouseDown,
    super.onMouseUp,
    super.onMouseMove,
  }) : super(tag: 'button');

  @override
  HTMLElement render() {
    final element = super.render() as HTMLButtonElement;
    if (child != null) {
      element.append(child!.render());
    }

    return element;
  }
}
