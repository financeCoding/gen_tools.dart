/* This file has been generated from location.idl - do not edit */

library chrome.location;

import '../src/common.dart';

/// Accessor for the `chrome.location` namespace.
final ChromeLocation location = new ChromeLocation._();

class ChromeLocation {
  static final JsObject _location = context['chrome']['location'];

  ChromeLocation._();

  /**
   * Starts a location watching request.
   *  |name| : Optional name to identify this request. Defaults to the empty
   *  string.
   *  |requestInfo| : Optional parameters for this request.
   *  Ends a location watching request.
   *  |name| : Optional name to identify the request to remove. Defaults to the
   *  empty string.
   */
  void watchLocation(String name, WatchLocationRequestInfo requestInfo) {
    _location.callMethod('watchLocation', [name, requestInfo]);
  }

  /**
   * 
   */
  void clearWatch(String name) {
    _location.callMethod('clearWatch', [name]);
  }

  /**
   * Fired when a location change is detected.
   *  |location| : An object containing matching events and new location.
   *  Fired when detecting location in not possible.
   *  |error| : Human-readable error description.
   */
  Stream<Location> get onLocationUpdate => _onLocationUpdate.stream;

  final ChromeStreamController<Location> _onLocationUpdate =
      new ChromeStreamController<Location>.oneArg(_location['onLocationUpdate'], Location.create);

  /**
   * 
   */
  Stream<String> get onLocationError => _onLocationError.stream;

  final ChromeStreamController<String> _onLocationError =
      new ChromeStreamController<String>.oneArg(_location['onLocationError'], selfConverter);
}

/**
 * Parameter of onLocationUpdate event's listener.
 */
class Coordinates extends ChromeObject {
  static Coordinates create(JsObject proxy) => proxy == null ? null : new Coordinates.fromProxy(proxy);

  Coordinates({double latitude, double longitude, double altitude, double accuracy, double altitudeAccuracy, double heading, double speed}) {
    if (latitude != null) this.latitude = latitude;
    if (longitude != null) this.longitude = longitude;
    if (altitude != null) this.altitude = altitude;
    if (accuracy != null) this.accuracy = accuracy;
    if (altitudeAccuracy != null) this.altitudeAccuracy = altitudeAccuracy;
    if (heading != null) this.heading = heading;
    if (speed != null) this.speed = speed;
  }

  Coordinates.fromProxy(JsObject proxy): super.fromProxy(proxy);

  double get latitude => proxy['latitude'];
  set latitude(double value) => proxy['latitude'] = value;

  double get longitude => proxy['longitude'];
  set longitude(double value) => proxy['longitude'] = value;

  double get altitude => proxy['altitude'];
  set altitude(double value) => proxy['altitude'] = value;

  double get accuracy => proxy['accuracy'];
  set accuracy(double value) => proxy['accuracy'] = value;

  double get altitudeAccuracy => proxy['altitudeAccuracy'];
  set altitudeAccuracy(double value) => proxy['altitudeAccuracy'] = value;

  double get heading => proxy['heading'];
  set heading(double value) => proxy['heading'] = value;

  double get speed => proxy['speed'];
  set speed(double value) => proxy['speed'] = value;
}

/**
 * Parameter of watchLocation call.
 */
class Location extends ChromeObject {
  static Location create(JsObject proxy) => proxy == null ? null : new Location.fromProxy(proxy);

  Location({String name, Coordinates coords, double timestamp}) {
    if (name != null) this.name = name;
    if (coords != null) this.coords = coords;
    if (timestamp != null) this.timestamp = timestamp;
  }

  Location.fromProxy(JsObject proxy): super.fromProxy(proxy);

  String get name => proxy['name'];
  set name(String value) => proxy['name'] = value;

  Coordinates get coords => Coordinates.create(proxy['coords']);
  set coords(Coordinates value) => proxy['coords'] = value;

  double get timestamp => proxy['timestamp'];
  set timestamp(double value) => proxy['timestamp'] = value;
}

/**
 * TODO(vadimt): Consider adding getWatch() and getAllWatches().
 */
class WatchLocationRequestInfo extends ChromeObject {
  static WatchLocationRequestInfo create(JsObject proxy) => proxy == null ? null : new WatchLocationRequestInfo.fromProxy(proxy);

  WatchLocationRequestInfo({double minDistanceInMeters, double minTimeInMilliseconds, int maximumAge}) {
    if (minDistanceInMeters != null) this.minDistanceInMeters = minDistanceInMeters;
    if (minTimeInMilliseconds != null) this.minTimeInMilliseconds = minTimeInMilliseconds;
    if (maximumAge != null) this.maximumAge = maximumAge;
  }

  WatchLocationRequestInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  double get minDistanceInMeters => proxy['minDistanceInMeters'];
  set minDistanceInMeters(double value) => proxy['minDistanceInMeters'] = value;

  double get minTimeInMilliseconds => proxy['minTimeInMilliseconds'];
  set minTimeInMilliseconds(double value) => proxy['minTimeInMilliseconds'] = value;

  int get maximumAge => proxy['maximumAge'];
  set maximumAge(int value) => proxy['maximumAge'] = value;
}
