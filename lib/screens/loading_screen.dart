import 'package:flutter/material.dart';
import 'package:clima_flutter/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late Location location;

  void getData() async {
    String key = '28c32515d9139257119fcbcc74664a6f';
    String urlString =
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude.toString()}&lon=${location.longitude.toString()}&appid=$key';
    print(urlString);
    Uri url = Uri.parse(urlString);
    http.Response response = await http.get(url);
    print('------------------------------------------------\n'
        'Request: ${response.request} \n'
        'Status code: ${response.statusCode} \n'
        'Reason: ${response.reasonPhrase} \n'
        'Body: ${response.body} \n'
        '------------------------------------------------');

    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);

      double temperature = decodedData['main']['temp'];
      int condition = decodedData['weather'][0]['id'];
      String cityName = decodedData['name'];

      print(temperature);
      print(condition);
      print(cityName);
    }
  }

  void initState() {
    super.initState();
    getLocation();
    getData();
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
    getData();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                location.isPositionSet
                    ? print('lon: ${location.longitude.toString()}, '
                        'lat:${location.latitude.toString()}')
                    : print('Position is not set.');
              },
              child: Text('Is loc set!!!'),
            ),
            TextButton(
              onPressed: () {
                print(location.isLocationPermissionGranted);
              },
              child: Text('Is loc serv enabled!!!'),
            ),
            TextButton(
              onPressed: () {
                location = Location();
                print('Object reset');
              },
              child: Text('Get Location!!!'),
            ),
          ],
        ),
      ),
    );
  }
}
