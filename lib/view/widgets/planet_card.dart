import 'package:flutter/material.dart';

import '../../theme/res/color_set.dart';

class PlanetCard extends StatelessWidget {
  final String name;
  final String population;
  final String diameter;
  final String terrain;
  final List<dynamic> films;

  const PlanetCard(
      {super.key, required this.name,
      required this.population,
      required this.terrain,
      required this.diameter,
      required this.films});

  String getFilms(List<dynamic> films){
    String filmNumbers = "";
    for (int i=0; i<films.length; i++) {
      String film = films[i];
      film = film[film.length-2];
      filmNumbers += "Episodio $film";
      if (i<films.length-1) {
        filmNumbers += ", ";
      }
    }
    return filmNumbers;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex:2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: AppColor.secondary),),
                  ),
                  Text("Popolazione: $population"),
                  Text("Terreno: $terrain"),
                  Text("Diametro: $diameter"),
                  Text("Film: ${getFilms(films)}")
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColor.secondary),
              ),
            )
          ],
        ),
      ),
    );
  }
}
