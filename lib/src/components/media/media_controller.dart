import 'package:kitawi/kitawi.dart';

class MediaController {
  HTMLMediaElement? media;

  MediaController({this.media});

  static MediaController? of(Component media) {
    if (media is Media) {
      return MediaController(media: media.element as HTMLMediaElement);
    }

    throw Exception("Media controller can't be attached to this component");
  }

  void play() {
    if (media != null) {
      media?.play();
    }
  }

  void pause() {
    if (media != null) {
      media?.pause();
    }
  }

  void toggle() {
    if (media != null) {
      if (media?.paused == true) {
        play();
      } else {
        pause();
      }
    }
  }

  void stop() {
    if (media != null) {
      media?.pause();
      media?.currentTime = 0;
    }
  }

  void mute() {
    if (media != null) {
      media?.muted = true;
    }
  }

  void unmute() {
    if (media != null) {
      media?.muted = false;
    }
  }

  void toggleMute() {
    if (media != null) {
      media?.muted = !media!.muted;
    }
  }

  void setVolume(double volume) {
    if (media != null) {
      media?.volume = volume;
    }
  }

  void setPlaybackRate(double rate) {
    if (media != null) {
      media?.playbackRate = rate;
    }
  }

  void onPlay(void Function(Event) callback) {
    if (media != null) {
      media?.onPlay.listen(callback);
    }
  }

  void onPause(void Function(Event) callback) {
    if (media != null) {
      media?.onPause.listen(callback);
    }
  }

  void onEnded(void Function(Event) callback) {
    if (media != null) {
      media?.onEnded.listen(callback);
    }
  }

  void onTimeUpdate(void Function(Event) callback) {
    if (media != null) {
      media?.onTimeUpdate.listen(callback);
    }
  }

  void seekTo(double time) {
    if (media != null) {
      media?.currentTime = time;
    }
  }

  MediaState get state {
    if (media != null) {
      if (media!.paused) {
        return MediaState.paused;
      } else if (media!.ended) {
        return MediaState.ended;
      } else {
        return MediaState.playing;
      }
    }
    return MediaState.paused;
  }
}
