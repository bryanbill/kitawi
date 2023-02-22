import 'package:kitawi/src/basic.dart';
import 'package:kitawi/src/core/key.dart';
import 'dart:html' as html;

import 'package:kitawi/src/types/async_snapshot.dart';

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
  final Future<T> future;
  final Widget Function(AsynSnapshot<T> data) builder;
  final Widget? loadingWidget;
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
    final container = html.DivElement();

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
