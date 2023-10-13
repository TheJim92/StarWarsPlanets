import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:star_wars_planets/model/planet.dart';

class RemoteDataSource {
  Future<http.Response> checkUsername(String username) async {
    var url = "http://lab.gruppometa.it/test-js/check-username/";
    var response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username}),
    );
    debugPrint('Response status: ${response.statusCode}');
    debugPrint('Response body: ${response.body}');
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
    debugPrint('Response status: ${response.statusCode}');
    debugPrint('Response body: ${response.body}');
    return response;
  }

  List<Planet> deserializePlanets(Map<String, dynamic> json) {
    return json['results']
        .map<Planet>((planet) => Planet.fromJson(planet))
        .toList();
  }

  Future<List<Planet>> getPlanets(int page) async {
    var url = "https://swapi.dev/api/planets/?page=$page";
    var response = await http.get(Uri.parse(url)
      //,headers: {'Content-Type': 'application/json'}
    );
    debugPrint('Response status: ${response.statusCode}');
    debugPrint('Response body: ${response.body}');
    List<Planet> planets = deserializePlanets(jsonDecode(response.body));
    return planets;
  }

  Future<List<Planet>> searchPlanets(String name) async {
    var url = "https://swapi.dev/api/planets/?search=$name";
    var response = await http.get(Uri.parse(url)
      //,headers: {'Content-Type': 'application/json'}
    );
    debugPrint('Response status: ${response.statusCode}');
    debugPrint('Response body: ${response.body}');
    List<Planet> planets = deserializePlanets(jsonDecode(response.body));
    return planets;
  }

}
