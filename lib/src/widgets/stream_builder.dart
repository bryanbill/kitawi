import 'dart:async';

import 'package:kitawi/widgets.dart';
import 'dart:html' as html;

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
///   intialData: myStream.value,
///   errorWidgetBuilder: (error) => Text('Error: $error'),
/// )
/// ```
class StreamBuilder<T> extends Widget {
  /// The [Stream] to build the widget from.
  final Stream<T>? stream;

  /// The [Widget] to display after the stream has emitted its first event.
  final Widget Function(AsynSnapshot<T> data) builder;

  /// The data to display before the stream has emitted its first event.
  final T? initialData;

  /// The [Widget] to display when the stream emits an error.
  final Widget Function(dynamic error)? errorWidgetBuilder;

  /// [StreamSubscription] to the stream.
  StreamSubscription<T>? _subscription;

  /// Creates a new `StreamBuilder` widget.
  ///
  /// The `stream` argument is the stream to build the widget from.
  ///
  /// The `builder` argument is a function that takes the most recent event of
  /// the stream and returns a widget to display.
  ///
  /// The `initialData` argument is an optional [T] to be displayed before the
  /// stream emits its first event. If no [initialData] is provided,
  /// no widget will be displayed while waiting for the first event.
  ///
  /// The `errorWidgetBuilder` argument is an optional function that takes the
  /// error thrown by the stream as input and returns an error widget to display
  /// if the stream fails. If no error widget builder is provided, the error
  /// message will not be displayed.
  StreamBuilder({
    this.stream,
    required this.builder,
    this.initialData,
    this.errorWidgetBuilder,
    Key? key,
  }) : super(key: key);

  /// Creates the HTML element for the widget.
  @override
  html.Element createElement() {
    final container = html.DivElement();

    /// loading widget is displayed while waiting for the first event
    /// from the stream
    if (initialData != null) {
      container.children.add(builder(AsynSnapshot(
        data: initialData,
        error: null,
        hasData: true,
        hasError: false,
      )).render());
    }

    /// listen to the stream and update the widget when a new event is added
    /// to the stream
    _subscription = stream?.listen(
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

    return container
      ..style.height = '100%'
      ..style.width = '100%'
      ..style.display = 'flex'
      ..style.justifyContent = 'center'
      ..style.alignItems = 'center';
  }

  /// Cancels the subscription to the stream when the widget is removed from the
  /// tree.
  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
  }
}
