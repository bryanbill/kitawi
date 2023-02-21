import 'dart:html';
import 'dart:io' as io;

/// The [InlineToCSSConverter] class converts all inline styles to CSS rules.
///
/// This class is used to convert inline styles to CSS rules. It is used to
/// convert the inline styles in the Kitawi library to CSS rules.
///
/// ```dart
/// import 'package:kitawi/src/utils/inline_to_css_converter.dart';
///
/// void main() {
///  InlineToCSSConverter.convert();
/// }
///
/// ```
///
/// The [convert] method is used to convert the inline styles to CSS rules.

class InlineToCSSConverter {
  static void convert() {
    // Get all elements with inline styles
    List<Element> elements = document.querySelectorAll('[style]');

    // Create a map of CSS rules
    Map<String, String> rules = {};

    // Loop over the elements and extract the styles
    for (Element el in elements) {
      // Get the tag name and class of the element
      String tagName = el.tagName.toLowerCase();
      String className = el.classes.join('.');

      // Get the inline styles
      String? styles = el.attributes['style'];

      // Generate a unique class name
      String newClassName = 'style-${rules.length}';

      // Create a new CSS rule
      String cssRule = '$tagName.$className { $styles }';

      // Add the CSS rule to the map
      rules[newClassName] = cssRule;

      // Replace the inline styles with the new class name
      el.attributes.remove('style');
      el.classes.add(newClassName);
    }

    // Write the CSS rules to a new file
    String css = '';
    for (String rule in rules.values) {
      css += '$rule\n';
    }

    // Write the CSS to a file
    io.File('styles.css').writeAsStringSync(css);

    // add the css file to the html
    document.head!.append(
      Element.html(
        '<link rel="stylesheet" href="styles.css">',
      ),
    );
  }
}
