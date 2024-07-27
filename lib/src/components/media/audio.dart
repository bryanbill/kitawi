import 'package:kitawi/src/components/media/media.dart';
import 'package:kitawi/src/components/media/media_controller.dart';
import 'package:web/web.dart';

class Audio extends Media {
  /// Audio component.
  ///
  /// The [src] parameter is used to determine the source of the audio.
  Audio({
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
    super.tag = "audio",
    this.controls = MediaControl.values,
    this.autoPlay = false,
    this.loop = false,
    this.muted = false,
    this.playsInline = false,
    this.showControls = true,
  });

  /// Media controller for the audio.
  final MediaController? controller;

  /// Media controls for the audio.
  final List<MediaControl>? controls;

  /// Auto play the audio.
  final bool autoPlay;

  /// Loop the audio.
  final bool loop;

  /// Mute the audio.
  final bool muted;

  /// Plays inline.
  final bool playsInline;

  /// Show default controls.
  final bool showControls;
  @override
  HTMLAudioElement render() {
    final element = super.render() as HTMLAudioElement;
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
