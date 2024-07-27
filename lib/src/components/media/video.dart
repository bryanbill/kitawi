import 'package:kitawi/src/components/media/media.dart';
import 'package:kitawi/src/components/media/media_controller.dart';
import 'package:web/web.dart';

class Video extends Media {
  /// Video component.
  ///
  /// The [src] parameter is used to determine the source of the video.
  Video({
    required super.src,
    this.controller,
    super.className,
    super.style,
    super.id,
    super.attributes,
    super.children,
    super.fallback,
    super.poster,
    super.alt,
    super.width,
    super.height,
    super.onLoad,
    super.onError,
    super.onAbort,
    super.tag = "video",
    this.controls = MediaControl.values,
    this.autoPlay = false,
    this.loop = false,
    this.muted = false,
    this.playsInline = false,
    this.showControls = true,
  });

  /// Media controller for the video.
  final MediaController? controller;

  /// Media controls for the video.
  final List<MediaControl>? controls;

  /// Auto play the video.
  final bool autoPlay;

  /// Loop the video.
  final bool loop;

  /// Mute the video.
  final bool muted;

  /// Plays inline.
  final bool playsInline;

  /// Show default controls.
  final bool showControls;

  @override
  HTMLVideoElement render() {
    final element = super.render() as HTMLVideoElement;
    controller?.media = element;

    if (autoPlay) {
      element.setAttribute("autoplay", "true");
    }

    if (loop) {
      element.setAttribute("loop", "true");
    }

    if (muted) {
      element.setAttribute("muted", "true");
    }

    if (playsInline) {
      element.setAttribute("playsinline", "true");
    }

    if (showControls) {
      element.setAttribute("controls", "true");
    }

    element.setAttribute(
        "controlslist", controls!.map((control) => control.name).join(" "));

    return element;
  }
}
