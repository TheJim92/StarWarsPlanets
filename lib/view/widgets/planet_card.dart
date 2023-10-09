import 'package:flutter/material.dart';

class PlanetCard extends StatelessWidget {
  final String name;
  final String population;
  final String diameter;
  final String terrain;

  // String films
  const PlanetCard(
      {required this.name,
      required this.population,
      required this.terrain,
      required this.diameter});

  @override
  Widget build(BuildContext context) {
    return Card(
      //borderOnForeground: true,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name),
          Text(population),
          Text(terrain),
          Text(diameter),
        ],
      ),
    );
  }
}
