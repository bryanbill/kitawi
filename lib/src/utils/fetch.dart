import 'dart:convert';
import 'dart:html';

/// The fetch function is a wrapper around the dart:html [HttpRequest] class.
/// It is used to make HTTP requests to a server.
///
/// The following methods are supported:
/// * [get] - makes a GET request
/// * [post] - makes a POST request
/// * [put] - makes a PUT request
/// * [delete] - makes a DELETE request
/// * [patch] - makes a PATCH request
/// * [head] - makes a HEAD request

class Fetch {
  /// The [get] method makes a GET request to the specified [url].
  ///
  /// The [headers] argument is optional. It is used to add headers to the request.
  ///
  /// ```dart
  /// import 'package:kitawi/kitawi.dart';
  ///
  /// void main() async{
  ///     await Fetch.get('https://jsonplaceholder.typicode.com/todos/1');
  /// }
  /// ```
  static Future<Response?> get(String url, {List<Headers>? headers}) async {
    try {
      final composedHeaders = <String, String>{};
      if (headers != null) {
        for (final header in headers) {
          composedHeaders[header.name] = header.value as String;
        }
      }
      final req = await HttpRequest.request(url,
          method: 'GET', requestHeaders: composedHeaders);
      return Response(
          headers: req.responseHeaders,
          body: req.response,
          statusCode: req.status);
    } catch (e) {
      print(e);
      return null;
    }
  }

  /// The [post] method makes a POST request to the specified [url].
  /// It takes a [body] argument which is the data to be sent to the server.
  /// The [body] argument is optional.
  /// The [headers] argument is optional. It is used to add headers to the request.
  ///
  /// ```dart
  /// import 'package:kitawi/kitawi.dart';
  ///
  /// void main() async{
  ///    await Fetch.post('https://jsonplaceholder.typicode.com/todos/1');
  /// }
  ///
  /// ```
  static Future<Response?> post(String url,
      {List<Headers>? headers, String? body}) async {
    try {
      final composedHeaders = <String, String>{};
      if (headers != null) {
        for (final header in headers) {
          composedHeaders[header.name] = header.value as String;
        }
      }
      final req = await HttpRequest.request(url,
          method: 'POST', requestHeaders: composedHeaders, sendData: body);
      return Response(
          headers: req.responseHeaders,
          body: req.response,
          statusCode: req.status);
    } catch (e) {
      print(e);
      return null;
    }
  }

  /// The [put] method makes a PUT request to the specified [url].
  /// It takes a [body] argument which is the data to be sent to the server.
  /// The [body] argument is optional.
  /// The [headers] argument is optional. It is used to add headers to the request.
  ///
  /// ```dart
  /// import 'package:kitawi/kitawi.dart';
  /// void main() async{
  ///   await Fetch.put('https://jsonplaceholder.typicode.com/todos/1');
  /// }
  /// ```
  static Future<Response?> put(String url,
      {List<Headers>? headers, String? body}) async {
    try {
      final composedHeaders = <String, String>{};
      if (headers != null) {
        for (final header in headers) {
          composedHeaders[header.name] = header.value as String;
        }
      }
      final req = await HttpRequest.request(url,
          method: 'PUT', requestHeaders: composedHeaders, sendData: body);
      return Response(
          headers: req.responseHeaders,
          body: req.response,
          statusCode: req.status);
    } catch (e) {
      print(e);
      return null;
    }
  }

  /// The [delete] method makes a DELETE request to the specified [url].
  /// The [headers] argument is optional. It is used to add headers to the request.
  /// The [context] argument is optional. It is used to add a security context to the request.
  /// ```dart
  /// import 'package:kitawi/kitawi.dart';
  /// void main() async{
  ///  await Fetch.delete('https://jsonplaceholder.typicode.com/todos/1');
  /// }
  /// ```
  static Future<Response?> delete(String url, {List<Headers>? headers}) async {
    try {
      final composedHeaders = <String, String>{};
      if (headers != null) {
        for (final header in headers) {
          composedHeaders[header.name] = header.value as String;
        }
      }
      final req = await HttpRequest.request(url,
          method: 'DELETE', requestHeaders: composedHeaders);
      return Response(
          headers: req.responseHeaders,
          body: req.response,
          statusCode: req.status);
    } catch (e) {
      print(e);
      return null;
    }
  }

  /// The [patch] method makes a PATCH request to the specified [url].
  /// It takes a [body] argument which is the data to be sent to the server.
  /// The [body] argument is optional.
  /// The [headers] argument is optional. It is used to add headers to the request.
  /// The [context] argument is optional. It is used to add a security context to the request.
  /// ```dart
  /// import 'package:kitawi/kitawi.dart';
  ///
  /// void main() async{
  ///  await Fetch.patch('https://jsonplaceholder.typicode.com/todos/1');
  /// }
  /// ```
  static Future<Response?> patch(String url,
      {List<Headers>? headers, String? body}) async {
    try {
      final composedHeaders = <String, String>{};
      if (headers != null) {
        for (final header in headers) {
          composedHeaders[header.name] = header.value as String;
        }
      }
      final req = await HttpRequest.request(url,
          method: 'PATCH', requestHeaders: composedHeaders, sendData: body);
      return Response(
          headers: req.responseHeaders,
          body: req.response,
          statusCode: req.status);
    } catch (e) {
      print(e);
      return null;
    }
  }

  /// The [head] method makes a HEAD request to the specified [url].
  /// The [headers] argument is optional. It is used to add headers to the request.
  /// The [context] argument is optional. It is used to add a security context to the request.
  ///
  /// ```dart
  /// import 'package:kitawi/kitawi.dart';
  /// void main() async{
  ///   await Fetch.head('https://jsonplaceholder.typicode.com/todos/1');
  /// }
  /// ```
  static Future<Response?> head(String url, {List<Headers>? headers}) async {
    try {
      final composedHeaders = <String, String>{};
      if (headers != null) {
        for (final header in headers) {
          composedHeaders[header.name] = header.value as String;
        }
      }
      final req = await HttpRequest.request(url,
          method: 'HEAD', requestHeaders: composedHeaders);

      return Response(
          headers: req.responseHeaders,
          body: req.response,
          statusCode: req.status);
    } catch (e) {
      print(e);
      return null;
    }
  }
}

/// The [Headers] class is used to add headers to the request.
class Headers {
  final String name;
  final Object value;
  final bool? preserveCase;

  Headers(this.name, this.value, {this.preserveCase = false});
}

class Response {
  final Map<String, dynamic>? headers;
  final dynamic body;
  final int? statusCode;

  Response({this.headers, this.body, this.statusCode});

  dynamic get json => jsonDecode(body as String);
}
