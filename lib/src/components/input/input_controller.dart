import 'package:kitawi/kitawi.dart';

/// Input controller class that provides methods to interact with input elements.
class InputController {
  HTMLElement? input;

  InputController({this.input});

  /// Create an instance of [InputController] from a component.
  static InputController of(Component input) {
    if (input is Input) {
      return InputController(input: input.element as HTMLElement);
    }

    throw Exception("Input controller can't be attached to this component");
  }

  /// Focus on the input element.
  void focus() {
    if (input != null) {
      input?.focus();
    }
  }

  /// Blur the input element.
  void blur() {
    if (input != null) {
      input?.blur();
    }
  }

  /// Select the input element.
  void select() {
    if (input != null) {
      if (input?.tagName == "INPUT") {
        (input as HTMLInputElement).select();
      }

      if (input?.tagName == "TEXTAREA") {
        (input as HTMLTextAreaElement).select();
      }
    }
  }

  void clear() {
    if (input != null) {
      if (input?.tagName == "INPUT") {
        (input as HTMLInputElement).value = "";
      }

      if (input?.tagName == "TEXTAREA") {
        (input as HTMLTextAreaElement).value = "";
      }
    }
  }

  void setValue(String value) {
    if (input != null) {
      if (input?.tagName == "INPUT") {
        (input as HTMLInputElement).value = value;
      }

      if (input?.tagName == "TEXTAREA") {
        (input as HTMLTextAreaElement).value = value;
      }
    }
  }

  String getValue() {
    if (input != null) {
      if (input?.tagName == "INPUT") {
        return (input as HTMLInputElement).value;
      }

      if (input?.tagName == "TEXTAREA") {
        return (input as HTMLTextAreaElement).value;
      }
    }

    return "";
  }

  void setPlaceholder(String value) {
    if (input != null) {
      if (input?.tagName == "INPUT") {
        (input as HTMLInputElement).placeholder = value;
      }

      if (input?.tagName == "TEXTAREA") {
        (input as HTMLTextAreaElement).placeholder = value;
      }
    }
  }

  void onTextChange(void Function(String) callback) {
    if (input != null) {
      if (input?.tagName == "INPUT") {
        input?.onInput.listen((event) {
          callback((input as HTMLInputElement).value);
        });
      }

      if (input?.tagName == "TEXTAREA") {
        input?.onInput.listen((event) {
          callback((input as HTMLTextAreaElement).value);
        });
      }
    }
  }
}
