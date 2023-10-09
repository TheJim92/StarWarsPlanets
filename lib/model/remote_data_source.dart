import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:star_wars_planets/model/planet.dart';

class RemoteDataSource {
  Future<List<Planet>> getPlanets() async {
    var url = "https://swapi.dev/api/planets/";
    var response = await http.get(Uri.parse(url));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    List<Planet> planets = deserializePlanets(jsonDecode(response.body));
    return planets;
  }

  List<Planet> deserializePlanets(Map<String, dynamic> json) {
      return json['results'].map<Planet>((planet) => Planet.fromJson(planet)).toList();
  }
}
