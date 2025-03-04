import '../components/component.dart';

class Route {
  final Component Function(Map<String, String>) component;
  final Function()? beforeRender;

  Route({
    required this.component,
    this.beforeRender,
  });

  Map<String, String> params = {};
}
