import 'package:flutter/material.dart';
import 'package:star_wars_planets/model/remote_data_source.dart';
import 'package:star_wars_planets/view/widgets/planet_card.dart';

import 'model/planet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Star Wars Planets',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Planet>>(
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
    );
  }
}
