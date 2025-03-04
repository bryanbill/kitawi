import 'dart:js_interop';

import 'package:kitawi/kitawi.dart';

class Html extends Component {
  final String rawHtml;

  /// `isExternal`  is used to determin if the html contains its own css or js
  /// if `isExternal` is `true` then the html will be rendered as is inside a template tag
  final bool? isExternal;

  /// List of external resources to be loaded with the html
  final List<Map<String, String>>? resources;

  Html(
    this.rawHtml, {
    this.isExternal = false,
    this.resources = const [],
    super.className,
  });

  @override
  Element render() {
    HTMLElement? element;

    if (isExternal == true) {
      element = document.createElement('div') as HTMLTemplateElement;
      element.attachShadow(ShadowRootInit(mode: "open"));

      for (final resource in resources!) {
        if (resource['type'] == 'css') {
          final link = document.createElement('link') as HTMLLinkElement;
          link.rel = 'stylesheet';
          link.href = resource['url'] as String;
          element.shadowRoot!.append(link);
        } else if (resource['type'] == 'js') {
          final script = document.createElement('script') as HTMLScriptElement;
          script.src = resource['url'] as String;
          element.shadowRoot!.append(script);
        }
      }
    } else {
      element = document.createElement('div') as HTMLDivElement;
    }

    element.innerHTML = rawHtml.toJS;

    return element;
  }
}
