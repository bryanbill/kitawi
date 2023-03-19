import 'dart:html';

import 'package:kitawi/src/basic.dart';

class MediaQuery extends Widget {
  final MediaQueryData? data;
  final Widget Function(AsynSnapshot<MediaQueryData?> data) builder;

  final ValueStream<MediaQueryData> _valueStream =
      ValueStream<MediaQueryData>(MediaQueryData(size: Size(), theme: Theme()));
  MediaQuery({Key? key, required this.builder, this.data}) : super(key: key) {
    Size().updateSize();
    Theme().updateMode();
    _valueStream.value = MediaQueryData(size: Size(), theme: Theme());

    window.onResize.listen((event) {
      Size().updateSize();
      _valueStream.value = MediaQueryData(size: Size(), theme: Theme());
    });

    window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change',
        (event) {
      Theme().updateMode();
      _valueStream.value = MediaQueryData(size: Size(), theme: Theme());
    });
  }
  @override
  Element createElement() {
    return StreamBuilder<MediaQueryData?>(
        stream: _valueStream.stream,
        initialData: _valueStream.value,
        builder: (snapshot) => builder(snapshot)).render();
  }

  @override
  void dispose() {
    super.dispose();
    _valueStream.dispose();
    window.onResize.drain();
    window
        .matchMedia('(prefers-color-scheme: dark)')
        .removeEventListener('change', (event) {});
  }
}

class MediaQueryData {
  final Size size;
  final Theme theme;

  MediaQueryData({required this.size, required this.theme});

  MediaQueryData copyWith({Size? size, Theme? theme}) {
    return MediaQueryData(size: size ?? this.size, theme: theme ?? this.theme);
  }
}
