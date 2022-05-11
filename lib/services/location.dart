import 'package:geolocator/geolocator.dart';
import 'package:async/async.dart';

class Location {
  late final Future<Position> position;
  late final latitude;
  late final longitude;
  late final bool _isSet;

  Location() {
    getCurrentLocation();
  }

  void getCurrentLocation() {
    // desiredAccuracy : low is not working on emulator! :(
    position =
        Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    position.then((value) {
      longitude = value.longitude;
      latitude = value.latitude;
      _isSet = true;
    });
  }

  bool isPositionSet() {
    bool _;
    try {
      // This is initialised as true only
      // if not initialised then throws an error
      _ = _isSet;
    } catch (e) {
      _ = false;
    }
    return _;
  }
}

//   void getCurrentLocation() async {
//     LocationPermission permission = await Geolocator.requestPermission();

//     try {
//       Position position = await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.low);
//       latitude = position.latitude;
//       longitude = position.longitude;
//     } catch (e) {
//       print(e);
//     }
//   }
// }

// class _Location {

//   final Future position = Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.low);

// }
