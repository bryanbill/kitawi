import 'dart:html';

import 'package:kitawi/src/basic.dart';

/// This class is used to create a navigation bar widget.

class Navbar extends Widget {

  /// The [title] parameter is optional and specifies the title of the navigation bar.
  /// The [title] parameter can be any widget.
  final Widget? title;

  /// The [automaticallyImplyLeading] parameter is optional and specifies whether the navigation bar should automatically imply the leading widget.
  /// The default value is [false].
  final bool? automaticallyImplyLeading;

  /// The [leading] parameter is optional and specifies the leading widget of the navigation bar.
  /// The [leading] parameter can be any widget.
  final Widget? leading;

  /// The [actions] parameter is optional and specifies the actions of the navigation bar.
  /// The [actions] parameter can be any widget.
  final List<Widget>? actions;

  /// The [position] parameter is optional and specifies the position of the navigation bar.
  /// The [position] parameter can be any of the following values:
  /// - [Position.fixed] - The navigation bar will be fixed.
  /// - [Position.absolute] - The navigation bar will be absolute.
  /// - [Position.relative] - The navigation bar will be relative.
  /// - [Position.sticky] - The navigation bar will be sticky.
  /// - [Position.static] - The navigation bar will be static.
  final Position? position;

  /// The [backgroundColor] parameter is optional and specifies the background color of the navigation bar.
  /// The [backgroundColor] parameter can be any color.
  final Color? backgroundColor;

  /// The [shadowColor] parameter is optional and specifies the shadow color of the navigation bar.
  /// The [shadowColor] parameter can be any color.
  final Color? shadowColor;

  /// The [elevation] parameter is optional and specifies the elevation of the navigation bar.
  /// The [elevation] parameter can be any integer.
  final int? elevation;

  Navbar(
      {this.title,
      this.automaticallyImplyLeading = false,
      this.leading,
      this.actions,
      this.elevation = 1,
      this.position = Position.fixed,
      this.backgroundColor,
      this.shadowColor = Colors.red});

  @override
  Element createElement() {
    var elevation = this.elevation! * 10;
    print(elevation);
    return DivElement()
      ..style.backgroundColor = backgroundColor?.rgba
      ..style.padding = '16px'
      ..style.display = 'flex'
      ..style.alignItems = 'center'
      ..style.justifyContent = 'space-between'
      ..style.position = '$position'
      ..style.top = '0'
      ..style.left = '0'
      ..style.width = 'calc(100% - 32px)'
      ..style.height = '64px'
      ..children = [
        Sizedbox(width: Dimensions.percentageOf(30), child: leading)
            .createElement(),
        Expanded(child: title ?? Sizedbox()).createElement(),
        Sizedbox(
          width: Dimensions.percentageOf(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: actions ?? [],
          ),
        ).createElement()
      ]
      ..style.boxShadow = '0px 0px ${elevation}px 0px $shadowColor';
  }
}
