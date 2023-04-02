import 'dart:html';

import 'package:kitawi/kitawi.dart';
import 'package:kitawi/src/widgets/sized_widgets/preffered_size_widget.dart';

/// This class is used to create a navigation bar widget.

class Navbar extends PreferredSizeWidget {
  /// The [title] parameter is optional and specifies the title of the navigation bar.
  /// The [title] parameter can be any widget.
  final Widget? title;

  /// The [automaticallyImplyLeading] parameter is optional and specifies whether the navigation bar should automatically imply the leading widget.
  /// The default value is false.
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
  final double? elevation;

  Navbar(
      {this.title,
      this.automaticallyImplyLeading = false,
      this.leading,
      this.actions,
      this.elevation = 1.0,
      this.position = Position.relative,
      this.backgroundColor = Colors.transparent,
      this.shadowColor = Colors.grey});

  @override
  Element createElement() {
    final elev = elevation! * 10;
    return super.createElement()
      ..style.backgroundColor = backgroundColor?.rgba
      ..style.padding = '8px'
      ..style.display = 'flex'
      ..style.alignItems = 'center'
      ..style.justifyContent = 'space-between'
      ..style.position = '$position'
      ..style.top = '0'
      ..style.left = '0'
      ..style.width = 'calc(100% - 16px)'
      ..style.zIndex = '999'
      ..style.boxShadow = '0px 0px ${elev}px 0px ${shadowColor?.rgba}'
      ..children = [
        Container(
                height: 100.percent,
                constraints: BoxConstraints(maxWidth: 30.percent),
                alignment: Alignment.centerLeft,
                child: leading)
            .createElement(),
        Expanded(child: title ?? SizedBox()).createElement(),
        Container(
          height: 100.percent,
          constraints: BoxConstraints(maxWidth: 30.percent),
          alignment: Alignment.centerRight,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: actions ?? []),
        ).createElement()
      ];
  }
}
