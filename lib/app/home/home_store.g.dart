// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStore, Store {
  final _$dataAtom = Atom(name: '_HomeStore.data');

  @override
  ResultModel get data {
    _$dataAtom.context.enforceReadPolicy(_$dataAtom);
    _$dataAtom.reportObserved();
    return super.data;
  }

  @override
  set data(ResultModel value) {
    _$dataAtom.context.conditionallyRunInAction(() {
      super.data = value;
      _$dataAtom.reportChanged();
    }, _$dataAtom, name: '${_$dataAtom.name}_set');
  }

  final _$queryAtom = Atom(name: '_HomeStore.query');

  @override
  String get query {
    _$queryAtom.context.enforceReadPolicy(_$queryAtom);
    _$queryAtom.reportObserved();
    return super.query;
  }

  @override
  set query(String value) {
    _$queryAtom.context.conditionallyRunInAction(() {
      super.query = value;
      _$queryAtom.reportChanged();
    }, _$queryAtom, name: '${_$queryAtom.name}_set');
  }

  final _$isLoadingAtom = Atom(name: '_HomeStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.context.enforceReadPolicy(_$isLoadingAtom);
    _$isLoadingAtom.reportObserved();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.context.conditionallyRunInAction(() {
      super.isLoading = value;
      _$isLoadingAtom.reportChanged();
    }, _$isLoadingAtom, name: '${_$isLoadingAtom.name}_set');
  }

  final _$getDataAsyncAction = AsyncAction('getData');

  @override
  Future<void> getData({String nextUrl}) {
    return _$getDataAsyncAction.run(() => super.getData(nextUrl: nextUrl));
  }

  final _$nextPageDataAsyncAction = AsyncAction('nextPageData');

  @override
  Future<void> nextPageData() {
    return _$nextPageDataAsyncAction.run(() => super.nextPageData());
  }

  final _$getDataByQueryAsyncAction = AsyncAction('getDataByQuery');

  @override
  Future<void> getDataByQuery(String newQuery, {String nextUrl}) {
    return _$getDataByQueryAsyncAction
        .run(() => super.getDataByQuery(newQuery, nextUrl: nextUrl));
  }

  final _$nextPageDataByQueryAsyncAction = AsyncAction('nextPageDataByQuery');

  @override
  Future<void> nextPageDataByQuery() {
    return _$nextPageDataByQueryAsyncAction
        .run(() => super.nextPageDataByQuery());
  }

  final _$_HomeStoreActionController = ActionController(name: '_HomeStore');

  @override
  void setQuery(String newQuery) {
    final _$actionInfo = _$_HomeStoreActionController.startAction();
    try {
      return super.setQuery(newQuery);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }
}
