class Planet {
  final String name;
  final String population;
  final String diameter;
  final String terrain;
  //final String films;

  Planet(
      {required this.name,
      required this.population,
      required this.diameter,
      //required this.films,
      required this.terrain});

  factory Planet.fromJson(Map<String, dynamic> json) {
    return Planet(
      name: json['name'],
      population: json['population'],
      diameter: json['diameter'],
      terrain: json['terrain'],
      //films: json['films'],
    );
  }
}
