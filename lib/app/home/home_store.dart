import 'package:mobx/mobx.dart';

import 'package:sw_planets_app/app/home/home_service.dart';

import 'models/planet_model.dart';
import 'models/result_model.dart';
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
  bool isLoading = false;

  @action
  Future<void> getData({String nextUrl}) async {
    data = await service.getPlanets(nextUrl: nextUrl);
  }

  @action
  Future<void> nextPageData() async {
    if (data.nextUrl != null) {
      isLoading = true;

      final result = await service.getPlanets(nextUrl: data.nextUrl);

      final newPlanets = data.planets..addAll(result.planets);

      data = ResultModel(result.nextUrl, newPlanets);

      isLoading = false;
    } else {
      return;
    }
  }

  @action
  Future<void> getDataByQuery(
    String query, {
    String nextUrl,
  }) async {
    data = await service.getPlanetsByQuery(
      query,
      nextUrl: nextUrl,
    );
  }
}
