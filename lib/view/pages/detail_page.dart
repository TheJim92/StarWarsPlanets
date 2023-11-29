import 'package:flutter/material.dart';

import '../../model/planet.dart';
import '../../theme/res/color_set.dart';

class DetailPage extends StatelessWidget {
  final Planet planet;

  const DetailPage({super.key, required this.planet});

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
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text(planet.name)),
      body: SizedBox(
        width: screenWidth,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    width: 160,
                    height: 160,
                    decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColor.secondary),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(planet.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: AppColor.secondary),),
                ),
                const SizedBox(height: 32),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Popolazione: ${planet.population}"),
                    Text("Terreno: ${planet.terrain}"),
                    Text("Diametro: ${planet.diameter}"),
                    Text("Film: ${getFilms(planet.films)}")
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}

