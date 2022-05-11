import 'package:flutter/material.dart';
import 'package:clima_flutter/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late Location location;

  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    try {
      location = Location();
    } catch (e) {
      print(e);
    }

    // LocationPermission permission = await Geolocator.requestPermission();

    // if (permission != LocationPermission.denied ||
    //     permission != LocationPermission.deniedForever) {
    //   position = await Geolocator.getCurrentPosition(
    //       desiredAccuracy: LocationAccuracy.low);
    // }
    // print('Position is not assigned!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                location.isPositionSet()
                    ? print('lon: ${location.longitude.toString()}, '
                        'lat:${location.latitude.toString()}')
                    : print('Position is not set.');
              },
              child: Text('Is loc set!!!'),
            ),
            TextButton(
              onPressed: () {
                location = Location();
              },
              child: Text('Get Location!!!'),
            ),
          ],
        ),
      ),
    );
  }
}
