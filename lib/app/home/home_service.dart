import 'package:dio/dio.dart';
import 'package:sw_planets_app/app/home/models/planet_model.dart';
import 'package:sw_planets_app/app/home/models/result_model.dart';

class HomeService {
  final _client = Dio();

  Future<ResultModel> getPlanets({String nextUrl}) async {
    final baseUrl = nextUrl != null ? nextUrl : 'https://swapi.co/api/planets';

    final response = await _client.get(baseUrl);

    final count = response.data['count'];

    final _nextUrl = response.data['next'];

    final planets = List<PlanetModel>.from(
      response.data['results'].map(
        (planet) => PlanetModel.fromJson(planet),
      ),
    );

    return ResultModel(
      count: count,
      nextUrl: _nextUrl,
      planets: planets,
      searchedPlanets: [],
    );
  }

  Future<ResultModel> getPlanetsByQuery(String query, {String nextUrl}) async {
    final baseUrl = nextUrl != null
        ? nextUrl
        : 'https://swapi.co/api/planets/?search=$query';

    final response = await _client.get(baseUrl);

    final count = response.data['count'];

    final _nextUrl = response.data['next'];

    final planets = List<PlanetModel>.from(
      response.data['results'].map(
        (planet) => PlanetModel.fromJson(planet),
      ),
    );

    return ResultModel(
      count: count,
      nextUrl: _nextUrl,
      planets: [],
      searchedPlanets: planets,
    );
  }
}
