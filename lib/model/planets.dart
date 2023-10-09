import 'package:star_wars_planets/model/planet.dart';

class Planets {
  final List<dynamic> planets;

  Planets({required this.planets});

  factory Planets.fromJson(Map<String, dynamic> json) {
    return Planets(
      planets:
          json['results'].map((planet) => Planet.fromJson(planet)).toList(),
    );
  }
}
