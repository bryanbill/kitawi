import 'package:kitawi/widgets.dart';
import 'dart:html' as html;

/// A widget that asynchronously builds itself based on the result of a future.
///
/// When a `FutureBuilder` is created, it takes a `Future` and a `builder`
/// function as input. The `builder` function takes the result of the future
/// as input and returns a widget that will be displayed when the future
/// resolves. While the future is loading, the `loadingWidget` is displayed,
/// and if an error occurs, the `errorWidgetBuilder` is called to display an
/// error message.
///
/// Example:
///
/// ```dart
/// FutureBuilder<String>(
///   future: myFuture,
///   builder: (data) => Text(data),
///   loadingWidget: Text('Loading...'),
///   errorWidgetBuilder: (error) => Text('Error: $error'),
/// )
/// ```
class FutureBuilder<T> extends Widget {
  /// The future to build the widget from.
  final Future<T> future;

  /// A function that takes the result of the future and returns a widget to
  /// display.
  final Widget Function(AsynSnapshot<T> data) builder;

  /// An optional widget to display while the future is loading. If no loading
  /// widget is provided, no widget will be displayed while waiting for the
  /// future to resolve.
  final Widget? loadingWidget;

  /// An optional function that takes the error thrown by the future as input
  /// and returns an error widget to display if the future fails. If no error
  /// widget builder is provided, the error message will be displayed by default
  /// text widget.
  final Widget Function(dynamic error)? errorWidgetBuilder;

  FutureBuilder({
    required this.future,
    required this.builder,
    this.loadingWidget,
    this.errorWidgetBuilder,
    Key? key,
  }) : super(key: key);

  @override
  html.Element createElement() {
    final container = html.DivElement()
      ..style.width = '100%'
      ..style.height = '100%';

    if (loadingWidget != null) {
      container.children.add(loadingWidget!.render());
    }

    future.then((data) {
      container.children.clear();
      container.children.add(builder(AsynSnapshot(
        data: data,
        error: null,
        hasData: true,
        hasError: false,
      )).render());
    }).onError((error, stackTrace) {
      print(stackTrace);
      print(error);
      container.children.clear();
      if (errorWidgetBuilder != null) {
        container.children.add(errorWidgetBuilder!(error).render());
      } else {
        container.children.add(Text(error.toString()).render());
      }
    });

    return container;
  }
}
