import 'dart:async';
import 'dart:html';

class FilePicker {
  static Future<List<File>?> pick({
    FileType? accepts,
    bool multiple = true,
    void Function(void)? onProgress,
  }) async {
    try {
      final completer = Completer<List<File>>();

      final accept = accepts == FileType.image
          ? 'image/*'
          : accepts == FileType.video
              ? 'video/*'
              : accepts == FileType.audio
                  ? 'audio/*'
                  : '*/*';

      //create a new input element
      final InputElement input = InputElement()
        ..type = 'file'
        ..accept = accept
        ..multiple = multiple;

      //listen for change event
      input.onChange.listen((e) {
        //read file content as dataURL
        final f = input.files;
        if (f != null && f.length == 1) {
          completer.complete(f);
        }
      });


      //trigger file selector
      input.click();
      return completer.future;
    } catch (e) {
      print(e);
      return null;
    }
  }
}

enum FileType { image, video, audio, file }
