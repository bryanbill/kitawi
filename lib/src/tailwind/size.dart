class Size {
  final dynamic value;
  Size(this.value);

  final tailwindSizes = [
    'xs',
    'sm',
    'md',
    'lg',
    'xl',
    '2xl',
    '3xl',
    '4xl',
    '5xl',
    '6xl',
    '7xl',
  ];

  String get size {
    if (value is num) {
      return '$value';
    } else if (tailwindSizes.contains(value)) {
      return value;
    } else {
      return '[$value]';
    }
  }

  static Size xs = Size('xs');
  static Size sm = Size('sm');
  static Size md = Size('md');
  static Size lg = Size('lg');
  static Size xl = Size('xl');
  static Size _2xl = Size('2xl');
  static Size _3xl = Size('3xl');
  static Size _4xl = Size('4xl');
  static Size _5xl = Size('5xl');
  static Size _6xl = Size('6xl');
  static Size _7xl = Size('7xl');
}

extension SizeExt on num {
  Size get px => Size("${this}px");
  Size get rem => Size("${this}rem");
  Size get em => Size("${this}em");
  Size get percent => Size("${this}%");
  Size get vh => Size("${this}vh");
  Size get vw => Size("${this}vw");
  Size get ch => Size("${this}ch");
  Size get mm => Size("${this}mm");
  Size get cm => Size("${this}cm");
}
