import 'package:geolocator/geolocator.dart';
import 'package:async/async.dart';

class Location {
  late final Position position;
  late final latitude;
  late final longitude;
  late final LocationPermission locationPermission;
  bool isPositionSet = false;
  bool isLocationPermissionGranted = false;

  Location() {
    getLocationPermission();
    getCurrentLocation();
  }

  // void checkLocationService() {
  //   Geolocator.isLocationServiceEnabled()
  //       .then((value) => isLocationServiceEnabled = value);
  // }

  // void requestLocationService() {
  //   Geolocator.isLocationServiceEnabled()
  //       .then((value) => isLocationServiceEnabled = value);
  // }

  void getLocationPermission() async {
    try {
      await Geolocator.requestPermission().then((value) {
        if (value == LocationPermission.always ||
            value == LocationPermission.whileInUse) {
          isLocationPermissionGranted = true;
          print('Location permission granted!!');
        } else {
          print('Not granted? $value.toString()');
        }
      }).catchError((onError) {
        print('Error: $onError.toString()');
      });
    } catch (e) {
      print(e);
    }
  }

  void getCurrentLocation() async {
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      longitude = position.longitude;
      latitude = position.latitude;
      isPositionSet = true;
    } catch (e) {
      print(e);
    }

    // await Geolocator.getCurrentPosition(
    //         desiredAccuracy: LocationAccuracy.best,
    //         forceAndroidLocationManager: false)
    //     .then((value) {
    //   longitude = value.longitude;
    //   latitude = value.latitude;
    //   isPositionSet = true;
    //   print('position is set');
    // }).catchError((onError) {
    //   print('Error: $onError.toString()');
    // });
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