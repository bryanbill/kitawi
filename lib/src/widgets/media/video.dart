import 'dart:async';
import 'dart:html';

import 'package:kitawi/widgets.dart';

/// This [Video] class is a widget that is used to render video elements
///
class Video extends Widget {
  final String src;
  final MediaController? controller;
  final double? ratio;
  final Function(Duration)? onDurationChanged;

  Video(this.src,
      {Key? key, this.controller, this.ratio, this.onDurationChanged});

  @override
  Element createElement() {
    var safeHash = src.hashCode.toString().replaceAll('-', 'n');
    key = key ?? Key(safeHash);
    var video = VideoElement();
    controller?.element = video;
    controller?.key = key;
    video
      ..id = key!.value
      ..style.width = '100%'
      ..style.height = '100%'
      ..style.objectFit = 'cover'
      ..setAttribute('src', src)
      ..setAttribute('autoPictureInPicture',
          controller?.autoPictureInPicture!.toString() ?? 'false')
      ..setAttribute('crossOrigin', controller?.crossOrigin ?? '')
      ..setAttribute('disablePictureInPicture',
          controller?.disablePictureInPicture!.toString() ?? 'false')
      ..setAttribute('disableRemotePlayback',
          controller?.disableRemotePlayback!.toString() ?? 'false')
      ..setAttribute('muted', controller?.muted!.toString() ?? 'true')
      ..setAttribute(
          'playsInline', controller?.playsInline!.toString() ?? 'false')
      ..setAttribute('preload', controller?.preload ?? 'auto')
      ..setAttribute('poster', controller?.poster ?? '');

    if (controller?.controls != null && controller!.controls!) {
      video.setAttribute('controls', controller!.controls!.toString());
    }

    if (controller?.autoPlay != null && controller!.autoPlay!) {
      video.setAttribute('autoplay', controller!.autoPlay!.toString());
    }

    if (controller?.loop != null && controller!.loop!) {
      video.setAttribute('loop', controller!.loop!.toString());
    }

    if (controller?.controlsList != null) {
      var controlsList = '';
      for (var element in controller!.controlsList!) {
        controlsList += '${element.toString().split('.').last},';
      }
      controlsList = controlsList.substring(0, controlsList.length - 1);
      video.setAttribute('controlsList', controlsList);
    }

    if (onDurationChanged != null) {
      video.onTimeUpdate.listen((event) {
        onDurationChanged!(Duration(seconds: video.currentTime.toInt()));
      });
    }

    return video;
  }
}

class MediaController {
  final bool? autoPlay;
  final bool? autoPictureInPicture;
  final bool? controls;
  final List<Controls>? controlsList;
  final String? crossOrigin;
  final bool? disablePictureInPicture;
  final bool? disableRemotePlayback;
  final bool? loop;
  final bool? muted;
  final bool? playsInline;
  final String? preload;
  final String? poster;

  VideoElement? _element;
  Key? key;

  MediaController({
    this.autoPlay = true,
    this.autoPictureInPicture = false,
    this.controls = false,
    this.controlsList,
    this.crossOrigin,
    this.disablePictureInPicture = false,
    this.disableRemotePlayback = false,
    this.loop = false,
    this.muted = true,
    this.playsInline = false,
    this.preload = 'auto',
    this.poster,
  });

  set element(VideoElement? element) {
    _element = element;
  }

  Future<Duration?> get duration async {
    // check if the _element has been created
    _element ??= querySelector('#${key?.value.toString()}') as VideoElement?;
    return Duration(seconds: _element?.duration as int);
  }

  void play() {
    _element?.play();
  }

  void pause() {
    _element?.pause();
  }

  void stop() {
    _element?.pause();
    _element?.currentTime = 0;
  }

  void seek(Duration duration) {
    _element?.currentTime = duration.inSeconds.toDouble();
  }

  Stream<Duration?>? get onDurationChange {
    _element ??= querySelector('#${key?.value.toString()}') as VideoElement?;
    return _element?.onDurationChange
        .map((event) => Duration(seconds: _element?.duration as int));
  }

  Stream<Duration?>? get onTimeUpdate {
    _element ??= querySelector('#${key?.value.toString()}') as VideoElement?;
    return _element?.onTimeUpdate
        .map((event) => Duration(seconds: _element?.currentTime as int));
  }
}

enum Controls {
  nodownload,
  noremoteplayback,
  nofullscreen,
}
