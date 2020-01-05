import 'package:meta/meta.dart';
import 'package:sw_planets_app/app/home/models/planet_model.dart';

class ResultModel {
  ResultModel({
    @required this.count,
    @required this.nextUrl,
    @required this.planets,
    @required this.searchedPlanets,
  });

  final int count;
  final String nextUrl;
  final List<PlanetModel> planets;
  final List<PlanetModel> searchedPlanets;

  ResultModel copyWith({
    int count,
    String nextUrl,
    List<PlanetModel> planets,
    List<PlanetModel> searchedPlanets,
  }) =>
      ResultModel(
        count: count ?? this.count,
        nextUrl: nextUrl ?? this.nextUrl,
        planets: planets ?? this.planets,
        searchedPlanets: searchedPlanets ?? this.searchedPlanets,
      );
}
