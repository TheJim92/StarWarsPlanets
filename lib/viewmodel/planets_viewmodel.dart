import 'package:flutter/material.dart';

import '../model/planet.dart';
import '../model/remote_data_source.dart';

class PlanetsViewmodel extends ChangeNotifier {
  List<Planet> planets = [];
  bool isLoading = false;
  int page = 1;
  TextEditingController searchController = TextEditingController();

  void toggleLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void getPlanets(int page) async {
    toggleLoading();
    planets = await RemoteDataSource().getPlanets(page);
    toggleLoading();
    notifyListeners();
  }

  void setPage(int page) {
    if (page > 0 && page < 7) {
      this.page = page;
      getPlanets(page);
    }
  }

  void decrementPage() {
    setPage(page - 1);
  }

  void incrementPage() {
    setPage(page + 1);
  }

  void initPlanets() {
    setPage(1);
  }
}