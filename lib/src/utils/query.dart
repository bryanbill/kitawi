import 'dart:async';

import 'package:kitawi/kitawi.dart';

/// Query utility.
///
/// This utility is used to manipulate the query string of the URL.
///
/// Example:
/// ```dart
/// import 'package:kitawi/ui.dart';
///
/// void main() {
///  Query.onChange((query) {
///   print(query);
/// });
///
/// Query.set({
///  'name': 'John Doe',
/// });
///
/// Query.remove('name');
///
/// Query.clear();
/// }
///
/// ```
class Query {
  static final StreamController _controller =
      StreamController<Map<String, String>>.broadcast();

  /// Set the query string. It will append the query string to the URL.
  /// It will override the existing query string in case the key already exists.
  ///
  /// This method will trigger the `onChange` event.
  static void set(Map<String, String> query) {
    final searchParams = window.location.search;
    final uri = Uri(
      queryParameters: {
        ...Uri.parse(searchParams).queryParameters,
        ...query,
      },
    );

    window.history.pushState(null, '', uri.toString());
    _controller.add(uri.queryParameters);
  }

  /// Get the query string as a map.
  static Map<String, String> getAll() {
    final query = window.location.search;
    final uri = Uri.parse(query);

    return uri.queryParameters;
  }

  /// Get the value of a query parameter.
  static String? get(String key) {
    final query = window.location.search;
    final uri = Uri.parse(query);

    return uri.queryParameters[key];
  }

  /// Remove a query parameter.
  ///
  /// This method will trigger the `onChange` event.
  static void remove(String key) {
    var query = window.location.search;
    var queryObject = query
        .split("&")
        .map((e) {
          final parts = e.split("=");
          return parts[0].replaceAll("?", "") == key ? null : e;
        })
        .where((e) => e != null)
        .join("&");

    window.history.pushState(
      null,
      '',
      queryObject.isEmpty ? '/' : '?$queryObject',
    );
  }

  /// Clear the query string.
  ///
  /// This method will trigger the `onChange` event.
  static void clear() {
    window.history.pushState(null, '', '/');
  }

  /// Listen to changes in the query string.
  ///
  /// The `callback` function will be called whenever the query string changes.
  ///
  /// The `immediate` parameter is used to determine if the callback should be called immediately.
  ///
  /// The `runOnce` parameter is used to determine if the callback should be called only once.
  static void onChange(
    Function(Map<String, String>) callback, {
    bool? immediate = false,
    bool? runOnce = false,
  }) {
    _controller.stream.listen((data) {
      if (immediate!) {
        callback(data);
      } else {
        // delay the callback to allow the query string to be updated
        Future.delayed(Duration(milliseconds: 100), () {
          callback(data);
        });
      }

      if (runOnce!) {
        _controller.close();
      }

      callback(data);
    });
  }

  static String stringify(Map<String, String> query) {
    return Uri(queryParameters: query).query;
  }
}
