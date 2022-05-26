import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String urlString;

  NetworkHelper(this.urlString);

  Future getData() async {
    print(urlString);
    Uri url = Uri.parse(urlString);
    http.Response response = await http.get(url);

    if (response.statusCode != 200) {
      print(response.statusCode);
      return;
    }

    String data = response.body;
    var decodedData = jsonDecode(data);

    print('------------------------------------------------\n'
        'Request: ${response.request} \n'
        'Status code: ${response.statusCode} \n'
        'Reason: ${response.reasonPhrase} \n'
        'Body: ${response.body} \n'
        '------------------------------------------------');

    return decodedData;

    // double temperature = decodedData['main']['temp'];
    // int condition = decodedData['weather'][0]['id'];
    // String cityName = decodedData['name'];

    // print(temperature);
    // print(condition);
    // print(cityName);
  }
}
