import 'dart:html';

import 'package:kitawi/src/basic.dart';

// mixin WidgetMixin {
//   /// The [widgetOf] method is used to get the widget of the specified key.
//   /// The [key] parameter is required and specifies the key of the widget.
//   /// The [widgetOf] method can be used as follows:
//   /// ```dart
//   /// widgetOf(key); // Returns the widget of the specified key.
//   /// ```

//   Widget? widgetOf(Key key) {
//     try {
//       // find the document whose id is the key
//       final element = document.getElementById(key.value);

//       final type = element?.tagName.toLowerCase();

//       // value of the element
//       var value = element?.innerHtml;

//       Widget? widget;
//       // match each type of widget with its corresponding class
//       switch (type) {
//         case 'div':
//           // check if the elemt contains any decoration
//           if (element?.style.backgroundColor != '' ||
//               element?.style.backgroundImage != '' ||
//               element?.style.backgroundSize != '' ||
//               element?.style.backgroundPosition != '' ||
//               element?.style.backgroundRepeat != '') {
//             widget = Container(key: key);
//           } else {
//             widget = SizedBox(key: key);
//           }
//           break;
//         case 'p':
//           widget = Text('$value', key: key);
//           break;
//         default:
//       }
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }
// }
