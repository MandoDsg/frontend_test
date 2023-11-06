import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<String>> calculateShortestPath(
    String startStation, String endStation) async {
  final response = await http.post(
      Uri.parse('http://192.168.50.199:3000/calculate-path'),
      headers: <String, String>{'Content-Type': 'application/json'},
      body:
          jsonEncode({'startStation': startStation, 'endStation': endStation}));

  if (response.statusCode == 200) {
    final decodedResponse = jsonDecode(response.body);
    return List<String>.from(decodedResponse['shortestPath']);
  } else {
    throw Exception('Failed to calculate shortest path.');
  }
}

Future<List<Map<String, dynamic>>> fetchAllStations() async {
  final response =
      await http.get(Uri.parse('http://192.168.50.199:3000/stations'));
  if (response.statusCode == 200) {
    return List<Map<String, dynamic>>.from(json.decode(response.body));
  } else {
    throw Exception('Failed to fetch cities.');
  }
}

Future<List<Map<String, dynamic>>> fetchDataFromAPI() async {
  final response =
      await http.get(Uri.parse('http://192.168.50.199:3000/stations'));
  if (response.statusCode == 200) {
    final data = json.decode(response.body) as List;
    final stations = data.map((stationData) {
      return {
        'name': stationData['name'],
        'imageUrl': stationData['imageUrl'],
      };
    }).toList();
    return stations;
  } else {
    throw Exception('Failed to load data from the API');
  }
}
