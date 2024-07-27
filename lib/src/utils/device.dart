import 'package:kitawi/kitawi.dart';

Device kDevice = Device();

/// Contains device specific information
class Device {
  /// Returns the view width of the device
  int get viewWidth => window.innerWidth;

  /// Returns the view height of the device
  int get viewHeight => window.innerHeight;

  const Device();
}
