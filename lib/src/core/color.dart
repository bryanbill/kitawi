/// Color is a class that represents a color in RGBA space.
class Color {
  final int _value;

  const Color(this._value);

  factory Color.fromARGB(int a, int r, int g, int b) {
    return Color((a << 24) | (r << 16) | (g << 8) | b);
  }

  int get alpha => (_value >> 24) & 0xff;

  int get red => (_value >> 16) & 0xff;

  int get green => (_value >> 8) & 0xff;

  int get blue => _value & 0xff;

  Color withAlpha(int alpha) {
    return Color.fromARGB(alpha, red, green, blue);
  }

  Color withRed(int red) {
    return Color.fromARGB(alpha, red, green, blue);
  }

  Color withGreen(int green) {
    return Color.fromARGB(alpha, red, green, blue);
  }

  Color withBlue(int blue) {
    return Color.fromARGB(alpha, red, green, blue);
  }

  Color withOpacity(double opacity) {
    return Color.fromARGB((opacity * 255).round(), red, green, blue);
  }

  String get rgba {
    return 'rgba($red, $green, $blue, ${alpha / 255})';
  }
}
