import 'package:flutter/material.dart';
import 'package:star_wars_planets/model/remote_data_source.dart';
import 'package:star_wars_planets/view/widgets/planet_card.dart';

import '../../model/planet.dart';
import '../../theme/res/color_set.dart';

class PlanetsPage extends StatefulWidget {
  const PlanetsPage({super.key});

  final String title = 'Planets';

  @override
  State<PlanetsPage> createState() => _PlanetsPageState();
}

class _PlanetsPageState extends State<PlanetsPage> {
  late Future<String> responseBody;
  List<Planet> planets = [];
  TextEditingController searchController = TextEditingController();

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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Planets"),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: TextField(
              decoration: const InputDecoration(
                label:
                    Text('Search', style: TextStyle(color: AppColor.secondary)),
              ),
              controller: searchController,
            ),
          ),
          Expanded(
            flex: 5,
            child: FutureBuilder<List<Planet>>(
              future: getPlanets(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    //  physics: NeverScrollableScrollPhysics(),
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
          ),
        ],
      ),
    );
  }
}
