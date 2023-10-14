import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:star_wars_planets/model/planet.dart';

class RemoteDataSource {
  // POST call that verifies username in registration page
  Future<String> checkUsername(String username) async {
    var url = "http://lab.gruppometa.it/test-js/check-username/";
    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username}),
      );
      debugPrint('Response status: ${response.statusCode}');
      debugPrint('Response body: ${response.body}');

      // Case 200 and no errors
      if (!response.body.contains('error') &&
          (response.statusCode.toString() == '200')) {
        return 'success';

        //Other cases
      } else if (response.body.contains('error') &&
          (response.statusCode.toString() == '200')) {
        List<String> errorStringList = response.body.split('"');
        String errorString = errorStringList[errorStringList.length - 2];
        return 'Error: $errorString';
      } else if (response.statusCode.toString() == '404') {
        return 'Errore: 404 Not Found';
      } else {
        return 'Errore: errore sconosciuto';
      }
    } on SocketException {
      return 'Nessuna connessione internet';
    } on HttpException {
      return 'Non trovato';
    } on FormatException {
      return 'Errore di formattazione della response';
    }
  }

  Future<String> registration(String username, String password,
      String firstName, String lastName) async {
    var url = "http://lab.gruppometa.it/test-js/registration/";
    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'password': password,
          'firstName': firstName,
          'lastName': lastName
        }),
      );
      debugPrint('Response status: ${response.statusCode}');
      debugPrint('Response body: ${response.body}');

      // Case 200 and no errors
      if (!response.body.contains('error') &&
          (response.statusCode.toString() == '200')) {
        return 'success';

        //Other cases
      } else if (response.statusCode.toString() == '404') {
        return 'Errore: 404 Not Found';
      } else {
        return '${response.statusCode} ${response.reasonPhrase ?? ""}';
      }
    } on SocketException {
      return 'Nessuna connessione internet';
    } on HttpException {
      return 'Non trovato';
    } on FormatException {
      return 'Errore di formattazione della response';
    }
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

  Future<List<Planet>?> searchPlanets(String name) async {
    var url = "https://swapi.dev/api/planets/?search=$name";
    try {
      var response = await http.get(Uri.parse(url)
          //,headers: {'Content-Type': 'application/json'}
          );
      debugPrint('Response status: ${response.statusCode}');
      debugPrint('Response body: ${response.body}');
      List<Planet> planets = deserializePlanets(jsonDecode(response.body));
      return planets;
    } on SocketException {
      return null;
    } on HttpException {
      return null;
    } on FormatException {
      return null;
    }
  }

  List<Planet> deserializePlanets(Map<String, dynamic> json) {
    return json['results']
        .map<Planet>((planet) => Planet.fromJson(planet))
        .toList();
  }
}
