import 'package:flutter/material.dart';
import 'package:star_wars_planets/view/pages/detail_page.dart';

import '../../model/planet.dart';
import '../../theme/res/color_set.dart';

class PlanetCard extends StatelessWidget {
  final Planet planet;
  const PlanetCard(
      {super.key,
      required this.planet});

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
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(planet: planet),
        ),
      ),
      child: Card(
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
                      child: Text(planet.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: AppColor.secondary),),
                    ),
                    Text("Popolazione: ${planet.population}"),
                    Text("Terreno: ${planet.terrain}"),
                    Text("Diametro: ${planet.diameter}"),
                    Text("Film: ${getFilms(planet.films)}")
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
      ),
    );
  }
}
