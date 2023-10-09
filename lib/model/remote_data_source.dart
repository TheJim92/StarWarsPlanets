import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:star_wars_planets/model/planets.dart';

class RemoteDataSource {
  Future<Planets> getPlanets() async {
    var url = "https://swapi.dev/api/planets/";
    var response = await http.get(Uri.parse(url));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');


    var planets = Planets.fromJson(jsonDecode(response.body));
    return planets;
  }
}
