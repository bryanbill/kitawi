import 'dart:html';

/// The [Seo] class provides a set of methods to set the SEO tags of a web page.
///
/// ```dart
/// import 'package:kitawi/kitawi.dart';
///
/// void main() {
///  Seo.setTitle('Kitawi');
/// Seo.setFavicon('https://kitawi.dev/favicon.ico');
/// Seo.setMetaTags([
///  Meta(name: 'description', content: 'A simple web framework for Dart'),
/// Meta(name: 'keywords', content: 'dart, web, framework'),
/// ]);
/// Seo.setThemeColor('#ffffff');
/// Seo.setViewport('width=device-width, initial-scale=1.0');
///
/// start(() {
///  run(MyApp());
/// });
/// }
///
/// ```

class Seo {
  /// The [setMetaTags] method takes a list of [Meta] objects as an argument and
  /// sets the meta tags of the web page.
  static void setMetaTags(List<Meta> metas) {
    final head = document.getElementsByTagName('head')[0];
    for (var meta in metas) {
      head.append(meta.render());
    }
  }

  /// The [setTitle] method takes a [String] as an argument and sets the title of
  /// the web page.
  static void setTitle(String title) {
    document.title = title;
  }

  /// The [setFavicon] method takes a [String] url as an argument and sets the favicon
  /// of the web page.
  static void setFavicon(String url) {
    final link = Element.tag('link');
    link.attributes['rel'] = 'icon';
    link.attributes['href'] = url;
    document.getElementsByTagName('head')[0].append(link);
  }

  /// The [setViewport] method takes a [String] as an argument and sets the viewport
  /// of the web page.
  ///
  /// ```dart
  /// Seo.setViewport('width=device-width, initial-scale=1.0');
  /// ```
  static void setViewport(String viewport) {
    final meta = Element.tag('meta');
    meta.attributes['name'] = 'viewport';
    meta.attributes['content'] = viewport;
    document.getElementsByTagName('head')[0].append(meta);
  }

  /// The [setThemeColor] method takes a [String] as an argument and sets the theme
  /// color of the web page.
  static void setThemeColor(String color) {
    final meta = Element.tag('meta');
    meta.attributes['name'] = 'theme-color';
    meta.attributes['content'] = color;
    document.getElementsByTagName('head')[0].append(meta);
  }

  /// The [setAppleTouchIcon] method takes a [String] url as an argument and sets the
  /// apple touch icon of the web page.
  static void setAppleTouchIcon(String url) {
    final link = Element.tag('link');
    link.attributes['rel'] = 'apple-touch-icon';
    link.attributes['href'] = url;
    document.getElementsByTagName('head')[0].append(link);
  }

  /// The [setAppleTouchStartupImage] method takes a [String] url as an argument and
  /// sets the apple touch startup image of the web page.
  static void setAppleTouchStartupImage(String url) {
    final link = Element.tag('link');
    link.attributes['rel'] = 'apple-touch-startup-image';
    link.attributes['href'] = url;
    document.getElementsByTagName('head')[0].append(link);
  }

  /// The [setAppleMobileWebAppCapable] method takes a [bool] as an argument and
  /// sets the apple mobile web app capable of the web page.
  static void setAppleMobileWebAppCapable(bool value) {
    final meta = Element.tag('meta');
    meta.attributes['name'] = 'apple-mobile-web-app-capable';
    meta.attributes['content'] = value ? 'yes' : 'no';
    document.getElementsByTagName('head')[0].append(meta);
  }
}

/// The [Meta] class is used to set the meta tags of a web page.
/// It takes two arguments, [name] and [content].
class Meta {
  final String name;
  final String content;
  Meta(this.name, this.content);

  /// The [render] method returns a [Node] object from the [Meta] object.
  Node render() {
    final meta = Element.tag('meta');
    meta.attributes['name'] = name;
    meta.attributes['content'] = content;
    return meta;
  }

  @override
  String toString() {
    return '<meta name="$name" content="$content" />';
  }
}
