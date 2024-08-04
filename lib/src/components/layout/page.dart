import 'package:kitawi/kitawi.dart';

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
  }) : super(tag: 'div');

  HTMLElement? _element;

  @override
  HTMLElement render() {
    _registerPathChangeListener();
    _element = super.render() as HTMLElement;

    return _element!;
  }

  void _registerPathChangeListener() {
    router.listen((path) {
      var page = _matchRoute(path);
      if (page == null) {
        // TODO: Show 404 page
      } else {
        clear();
        _element!.append(page.$1.builder(page.$2).render());
        onPageChange?.call(pages.indexOf(page.$1), page.$2);
      }
    });
  }

  (Page page, Map<String, String> params)? _matchRoute(String path) {
    for (final page in pages) {
      if (page.path == path) {
        return (page, {});
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
        return (page, params);
      }

      return null;
    }
    return null;
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
