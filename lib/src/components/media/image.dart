import 'package:kitawi/src/components/media/media.dart';
import 'package:web/web.dart';

class Image extends Media {
  /// Image component.
  ///
  /// The [src] parameter is used to determine the source of the image.

  Image({
    required super.src,
    super.className,
    super.id,
    super.style,
    super.attributes,
    super.alt,
    super.width,
    super.height,
    super.onLoad,
    super.onError,
    super.onAbort,
    super.tag = "img",
  });

  @override
  HTMLImageElement render() {
    final element = super.render() as HTMLImageElement;

    return element;
  }
}
