import 'package:kitawi/kitawi.dart';

class I extends Component {
  final String? text;
  I({
    this.text,
    super.className,
    super.tag = 'i',
  });

  @override
  HTMLElement render() {
    final i = super.render() as HTMLElement;
    if (text != null) {
      i.text = text!;
    }
    return i;
  }
}
