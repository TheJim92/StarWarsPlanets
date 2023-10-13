import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:star_wars_planets/model/planet.dart';

class RemoteDataSource {
  Future<http.Response> checkUsername(String username) async {
    var url = "http://lab.gruppometa.it/test-js/check-username/";
    var response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username}),
    //jsonEncode potrebbe essere la causa per cui lo username "prova" non ritorna l'errore
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }

  Future<http.Response> registration(String username, String password,
      String firstName, String lastName) async {
    var url = "http://lab.gruppometa.it/test-js/registration/";
    var response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password, 'firstName': firstName, 'lastName': lastName}),
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }

  Future<List<Planet>> getPlanets() async {
    var url = "https://swapi.dev/api/planets/";
    var response = await http.get(Uri.parse(url)
        //,headers: {'Content-Type': 'application/json'}
        );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    List<Planet> planets = deserializePlanets(jsonDecode(response.body));
    return planets;
  }

  List<Planet> deserializePlanets(Map<String, dynamic> json) {
    return json['results']
        .map<Planet>((planet) => Planet.fromJson(planet))
        .toList();
  }
}
