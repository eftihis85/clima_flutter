import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    Position? position;

    LocationPermission permission = await Geolocator.requestPermission();

    if (permission != LocationPermission.denied ||
        permission != LocationPermission.deniedForever) {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      print(position);
    }
    print('Position is not assigned!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
