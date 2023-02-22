import 'dart:async';

import 'package:kitawi/src/basic.dart';
import 'package:kitawi/src/core/key.dart';
import 'dart:html' as html;

import 'package:kitawi/src/types/async_snapshot.dart';

/// A widget that asynchronously builds itself based on the events of a stream.
///
/// When a `StreamBuilder` is created, it takes a `Stream` and a `builder`
/// function as input. The `builder` function takes the most recent event of the
/// stream as input and returns a widget that will be displayed. When a new
/// event is added to the stream, the `builder` function is called again to
/// update the widget. While the stream is waiting for the first event,
/// the `loadingWidget` is displayed, and if an error occurs, the
/// `errorWidgetBuilder` is called to display an error message.
///
/// Example:
///
/// ```dart
/// StreamBuilder<String>(
///   stream: myStream,
///   builder: (data) => Text(data),
///   loadingWidget: Text('Loading...'),
///   errorWidgetBuilder: (error) => Text('Error: $error'),
/// )
/// ```
class StreamBuilder<T> extends Widget {
  final Stream<T> stream;
  final Widget Function(AsynSnapshot<T> data) builder;
  final Widget? loadingWidget;
  final Widget Function(dynamic error)? errorWidgetBuilder;

  StreamSubscription<T>? _subscription;

  /// Creates a new `StreamBuilder` widget.
  ///
  /// The `stream` argument is the stream to build the widget from.
  ///
  /// The `builder` argument is a function that takes the most recent event of
  /// the stream and returns a widget to display.
  ///
  /// The `loadingWidget` argument is an optional widget to display while the
  /// stream is waiting for the first event. If no loading widget is provided,
  /// no widget will be displayed while waiting for the first event.
  ///
  /// The `errorWidgetBuilder` argument is an optional function that takes the
  /// error thrown by the stream as input and returns an error widget to display
  /// if the stream fails. If no error widget builder is provided, the error
  /// message will not be displayed.
  StreamBuilder({
    required this.stream,
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

    _subscription = stream.listen(
      (data) {
        container.children.clear();
        container.children.add(builder(AsynSnapshot(
          data: data,
          error: null,
          hasData: true,
          hasError: false,
        )).render());
      },
      onError: (error) {
        container.children.clear();
        if (errorWidgetBuilder != null) {
          container.children.add(errorWidgetBuilder!(error).render());
        }
      },
    );

    return container;
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
  }
}
