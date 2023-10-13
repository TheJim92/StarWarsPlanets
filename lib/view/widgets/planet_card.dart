import 'package:flutter/material.dart';

import '../../theme/res/color_set.dart';

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
                  Text("Population: " + population),
                  Text("Terrain: " + terrain),
                  Text("Diameter: " + diameter),
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
