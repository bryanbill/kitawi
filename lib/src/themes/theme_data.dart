import 'package:kitawi/kitawi.dart';

class ThemeData {
  /// The text theme for the application.
  ///
  /// Applies to all text and material icons in the application.
  final TextTheme? textTheme;

  final Color? primaryColor;
  final Color? primaryColorDark;
  final Color? secondaryColor;
  final Color? backgroundColor;
  final Color? surfaceColor;
  final Color? errorColor;

  ThemeData({
    this.textTheme,
    this.primaryColor,
    this.primaryColorDark,
    this.secondaryColor,
    this.backgroundColor,
    this.surfaceColor,
    this.errorColor,
  });

  ThemeData copyWith({
    TextTheme? textTheme,
    Color? primaryColor,
    Color? primaryColorDark,
    Color? secondaryColor,
    Color? backgroundColor,
    Color? surfaceColor,
    Color? errorColor,
  }) {
    return ThemeData(
      textTheme: textTheme ?? this.textTheme,
      primaryColor: primaryColor ?? this.primaryColor,
      primaryColorDark: primaryColorDark ?? this.primaryColorDark,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      surfaceColor: surfaceColor ?? this.surfaceColor,
      errorColor: errorColor ?? this.errorColor,
    );
  }

  @override
  String toString() {
    return 'ThemeData(textTheme: $textTheme, primaryColor: $primaryColor, primaryColorDark: $primaryColorDark, secondaryColor: $secondaryColor, backgroundColor: $backgroundColor, surfaceColor: $surfaceColor, errorColor: $errorColor)';
  }
}

class TextTheme {
  final TextStyle? headline1;
  final TextStyle? headline2;
  final TextStyle? headline3;
  final TextStyle? headline4;
  final TextStyle? headline5;
  final TextStyle? headline6;
  final TextStyle? subtitle1;
  final TextStyle? subtitle2;
  final TextStyle? bodyText1;
  final TextStyle? bodyText2;
  final TextStyle? button;
  final TextStyle? caption;
  final TextStyle? overline;

  TextTheme({
    this.headline1,
    this.headline2,
    this.headline3,
    this.headline4,
    this.headline5,
    this.headline6,
    this.subtitle1,
    this.subtitle2,
    this.bodyText1,
    this.bodyText2,
    this.button,
    this.caption,
    this.overline,
  });

  TextTheme copyWith({
    TextStyle? headline1,
    TextStyle? headline2,
    TextStyle? headline3,
    TextStyle? headline4,
    TextStyle? headline5,
    TextStyle? headline6,
    TextStyle? subtitle1,
    TextStyle? subtitle2,
    TextStyle? bodyText1,
    TextStyle? bodyText2,
    TextStyle? button,
    TextStyle? caption,
    TextStyle? overline,
  }) {
    return TextTheme(
      headline1: headline1 ?? this.headline1,
      headline2: headline2 ?? this.headline2,
      headline3: headline3 ?? this.headline3,
      headline4: headline4 ?? this.headline4,
      headline5: headline5 ?? this.headline5,
      headline6: headline6 ?? this.headline6,
      subtitle1: subtitle1 ?? this.subtitle1,
      subtitle2: subtitle2 ?? this.subtitle2,
      bodyText1: bodyText1 ?? this.bodyText1,
      bodyText2: bodyText2 ?? this.bodyText2,
      button: button ?? this.button,
      caption: caption ?? this.caption,
      overline: overline ?? this.overline,
    );
  }
}
