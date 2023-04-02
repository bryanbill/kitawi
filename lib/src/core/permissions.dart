import 'dart:html';

class Location {
  Future<Geoposition?> getCurrentPosition({
    bool? enableHighAccuracy,
    Duration? timeout,
    Duration? maximumAge,
  }) async {
    return await window.navigator.geolocation.getCurrentPosition(
      enableHighAccuracy: enableHighAccuracy,
      timeout: timeout,
      maximumAge: maximumAge,
    );
  }

  Stream<Geoposition> watchPosition(
    bool? enableHighAccuracy,
    Duration? timeout,
    Duration? maximumAge,
  ) {
    return window.navigator.geolocation.watchPosition(
      enableHighAccuracy: enableHighAccuracy,
      timeout: timeout,
      maximumAge: maximumAge,
    );
  }
}
