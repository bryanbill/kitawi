import 'dart:html';

import 'package:kitawi/kitawi.dart';

class ErrorWidget extends Widget {
  final String message;
  final String? details;

  ErrorWidget({Key? key, required this.message, this.details})
      : super(key: key);

  @override
  Element createElement() {
    return Container(
      height: 100.percent,
      width: 100.percent,
      alignment: Alignment.center,
      decoration: Decoration(
        color: Colors.red,
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(message,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
          SizedBox(height: 10.px),
          if (details != null)
            Text(details!, style: TextStyle(color: Colors.white)),
        ],
      ),
    ).render();
  }
}
