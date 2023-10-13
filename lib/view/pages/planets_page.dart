import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:star_wars_planets/model/remote_data_source.dart';
import 'package:star_wars_planets/view/widgets/planet_card.dart';
import 'package:star_wars_planets/viewmodel/planets_viewmodel.dart';

import '../../model/planet.dart';
import '../../theme/res/color_set.dart';

class PlanetsPage extends StatefulWidget {
  const PlanetsPage({super.key});

  @override
  State<PlanetsPage> createState() => _PlanetsPageState();
}

class _PlanetsPageState extends State<PlanetsPage> {
  final String title = 'Planets';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlanets();
  }

  initPlanets(){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PlanetsViewmodel>(context, listen: false).initPlanets();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlanetsViewmodel>(builder: (context, viewmodel, child) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Planets"),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Flexible(
                  flex: 2,
                  child: Column(
                    children: [
                      TextField(
                        decoration: const InputDecoration(
                          label: Text('Search',
                              style: TextStyle(color: AppColor.secondary)),
                        ),
                        controller: viewmodel.searchController,
                        /*onChanged: (text) {
                        for (Planet planet in planets) {
                          if (planet.name.contains(text)) {
                            planets.add(planet);
                          }
                          setState(() {
                          });
                        }
                      }
                      */
                      ),
                      ListTile(
                        leading: IconButton(
                            onPressed: () => viewmodel.decrementPage(),
                            icon: const Icon(Icons.chevron_left)),
                        trailing: IconButton(
                            onPressed: () => viewmodel.incrementPage(),
                            icon: const Icon(Icons.chevron_right)),
                        title: Text('Pagina ${viewmodel.page}', textAlign: TextAlign.center)
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: ListView.builder(
                    shrinkWrap: true,
                    //  physics: NeverScrollableScrollPhysics(),
                    itemCount: viewmodel.planets.length,
                    itemBuilder: (context, index) {
                      var planet = viewmodel.planets[index];
                      return PlanetCard(
                          name: planet.name,
                          population: planet.population,
                          terrain: planet.terrain,
                          diameter: planet.diameter);
                    },
                  ),
                ),
              ],
            ),
            viewmodel.isLoading
                ? Container(
                    decoration:
                        BoxDecoration(color: Colors.black.withAlpha(128)),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      );
    });
  }
}
