import 'package:flutter/material.dart';
import 'package:star_wars_planets/model/remote_data_source.dart';
import 'package:star_wars_planets/view/widgets/planet_card.dart';

import '../../model/planet.dart';

class PlanetsPage extends StatefulWidget {
  const PlanetsPage({super.key});

  final String title = 'Planets';

  @override
  State<PlanetsPage> createState() => _PlanetsPageState();
}

class _PlanetsPageState extends State<PlanetsPage> {
  late Future<String> responseBody;
  List<Planet> planets = [];

  @override
  void initState() {
    super.initState();
    getPlanets();
  }

  Future<List<Planet>> getPlanets() async {
    planets = await RemoteDataSource().getPlanets();
    return planets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text("Planets"),
    ),
      body: Column(
        children: [
          FutureBuilder<List<Planet>>(
            future: getPlanets(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: planets.length,
                  itemBuilder: (context, index) {
                    var planet = planets[index];
                    return PlanetCard(
                        name: planet.name,
                        population: planet.population,
                        terrain: planet.terrain,
                        diameter: planet.diameter);
                  },
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
