import 'package:sw_planets_app/app/home/models/planet_model.dart';

class ResultModel {
  ResultModel(this.nextUrl, this.planets);

  final String nextUrl;
  final List<PlanetModel> planets;
}
