import 'package:kitawi/kitawi.dart';

/// `router` is a global instance of the [Router] class. It's only available
/// when [PageView] is used as they work together to provide routing in the
/// application.
Router? router;

class PageView extends Component {
  final List<Page> pages;
  final String? initialPage;
  final void Function(int, Map<String, dynamic>)? onPageChange;

  PageView({
    super.id,
    super.attributes,
    super.style,
    super.className,
    this.initialPage,
    this.onPageChange,
    required this.pages,
  }) : super(tag: 'div') {
    
    router = Router(
      hasInitialPage: initialPage != null,
    );

    if (initialPage != null) {
      _matchRoute(initialPage!);
    }
  }

  HTMLElement? _element;

  @override
  HTMLElement render() {
    router?.listen(_matchRoute);
    _element = super.render() as HTMLElement;
    router?.create();
    
    return _element!;
  }

  void _matchRoute(String path) {
    for (final page in pages) {
      if (page.path == path) {
        clear();
        _element!.append(page.builder({}).render());
        onPageChange?.call(pages.indexOf(page), {});
        return;
      }

      final pagePaths = page.path.split('/');
      final pathParts = path.split('/');

      if (pagePaths.length != pathParts.length) {
        continue;
      }

      var params = <String, String>{};
      var match = true;
      for (var i = 0; i < pagePaths.length; i++) {
        if (pagePaths[i].startsWith(':')) {
          params[pagePaths[i].substring(1)] = pathParts[i];
        } else if (pagePaths[i] != pathParts[i]) {
          match = false;
          break;
        }
      }

      if (match) {
        clear();
        _element!.append(page.builder(params).render());
        onPageChange?.call(pages.indexOf(page), params);
      }
    }
  }
}

class Page {
  final String? title;
  final String path;
  final Component Function(
    Map<String, String>,
  ) builder;

  Page({this.title, required this.path, required this.builder});
}
