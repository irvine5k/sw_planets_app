import 'package:mobx/mobx.dart';
import 'package:sw_planets_app/app/home/home_service.dart';

import 'models/result_model.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  _HomeStore() {
    getData();
  }

  final service = HomeService();

  @observable
  ResultModel data;

  @observable
  String query;

  @observable
  bool isLoading = false;

  @action
  void setQuery(String newQuery) => query = newQuery;

  @action
  Future<void> getData({String nextUrl}) async {
    data = await service.getPlanets(nextUrl: nextUrl);
  }

  @action
  Future<void> nextPageData() async {
    if(data.count < data.planets.length) return;

    if (data.nextUrl != null) {
      isLoading = true;

      final result = await service.getPlanets(nextUrl: data.nextUrl);

      final newPlanets = data.planets..addAll(result.planets);

      data = data.copyWith(
        nextUrl: result.nextUrl,
        planets: newPlanets,
      );

      isLoading = false;
    } else {
      return;
    }
  }

  @action
  Future<void> getDataByQuery(
    String newQuery, {
    String nextUrl,
  }) async {
    query = newQuery;

    isLoading = true;

    final result = await service.getPlanetsByQuery(
      query,
      nextUrl: nextUrl,
    );

    data = data.copyWith(
      searchedPlanets: result.searchedPlanets,
    );

    print(data.searchedPlanets.first.name);

    isLoading = false;
  }

  @action
  Future<void> nextPageDataByQuery() async {
    if(data.count < data.searchedPlanets.length) return;

    if (data.nextUrl != null) {
      isLoading = true;

      final result = await service.getPlanetsByQuery(
        query,
        nextUrl: data.nextUrl,
      );

      final newPlanets = data.searchedPlanets..addAll(result.searchedPlanets);

      data = data.copyWith(
        nextUrl: result.nextUrl,
        searchedPlanets: newPlanets,
      );

      isLoading = false;
    } else {
      return;
    }
  }
}
