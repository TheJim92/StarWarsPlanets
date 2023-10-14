import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:star_wars_planets/view/widgets/planet_card.dart';
import 'package:star_wars_planets/viewmodel/planets_viewmodel.dart';

import '../../theme/res/color_set.dart';

class PlanetsPage extends StatefulWidget {
  const PlanetsPage({super.key});

  @override
  State<PlanetsPage> createState() => _PlanetsPageState();
}

class _PlanetsPageState extends State<PlanetsPage> {

  @override
  void initState() {
    super.initState();
    initPlanets();
  }

  initPlanets() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PlanetsViewmodel>(context, listen: false).initPlanets();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlanetsViewmodel>(builder: (context, viewmodel, child) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Pianeti"),
        ),
        body: !viewmodel.serviceError ? Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [

                  // Campo di ricerca
                  Flexible(
                    flex: 1,
                    child: TextField(
                        decoration: const InputDecoration(
                          label: Text('Cerca',
                              style: TextStyle(color: AppColor.secondary)),
                        ),
                        controller: viewmodel.searchController,
                        onChanged: (text) {
                          if (text.length % 2 == 0 && text.isNotEmpty) {
                            viewmodel.searchPlanets(text);
                          } else if (text.isEmpty) {
                            viewmodel.restorePage();
                          }
                        }),
                  ),

                  // Lista di pianeti
                  Expanded(
                    flex: 9,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/space_background.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: viewmodel.planets.length,
                        itemBuilder: (context, index) {
                          var planet = viewmodel.planets[index];
                          return PlanetCard(
                              name: planet.name,
                              population: planet.population,
                              terrain: planet.terrain,
                              diameter: planet.diameter,
                              films: planet.films);
                        },
                      ),
                    ),
                  ),
                  Flexible(
                      flex: 1,
                      child: ListTile(
                          leading: IconButton(
                              onPressed: () => viewmodel.decrementPage(),
                              icon: const Icon(Icons.chevron_left), color: AppColor.secondary),
                          trailing: IconButton(
                              onPressed: () => viewmodel.incrementPage(),
                              icon: const Icon(Icons.chevron_right), color: AppColor.secondary),
                          title: Text('Pagina ${viewmodel.page}',
                              textAlign: TextAlign.center)))
                ],
              ),
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

          //Layout di errore
        ) : Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/space_background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/deathstar.png'),
                const SizedBox(height: 20),
                const Text('Non riusciamo a trovare i pianeti, ci deve essere un problema.', textAlign: TextAlign.center,)
              ],
            ),
          ),
        ),
      );
    });
  }
}
