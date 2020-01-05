import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sw_planets_app/app/home/home_store.dart';
import 'package:sw_planets_app/app/home/models/planet_model.dart';
import 'package:sw_planets_app/app/home/widgets/planet_detail_widget.dart';

class PlanetsListBodyWidget extends StatefulWidget {
  final bool isSearch;

  const PlanetsListBodyWidget({Key key, this.isSearch}) : super(key: key);

  @override
  _PlanetsListItensWidgetState createState() => _PlanetsListItensWidgetState();
}

class _PlanetsListItensWidgetState extends State<PlanetsListBodyWidget> {
  ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<HomeStore>(context);

    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Observer(
        builder: (context) {
          print('isLoading ${store.isLoading}');

          List<PlanetModel> planets = widget.isSearch
              ? store.data?.searchedPlanets
              : store.data?.planets;

          if (store.data == null) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            );
          } else {
            return ListView.builder(
              controller: _controller
                ..addListener(
                  () {
                    if (_controller.offset ==
                        _controller.position.maxScrollExtent) {
                      if (store.data.count > planets.length) {
                        widget.isSearch
                            ? store.nextPageDataByQuery()
                            : store.nextPageData();
                      }
                    }
                  },
                ),
              shrinkWrap: true,
              itemCount: planets.length + 1,
              itemBuilder: (context, index) {
                if (index == planets.length) {
                  if (store.isLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    );
                  } else {
                    return Container();
                  }
                } else {
                  return Card(
                    color: Colors.grey[900].withOpacity(0.3),
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(12),
                      leading: Image.asset('assets/images/planet.png'),
                      title: Text(
                        planets[index].name,
                        style: TextStyle(
                          fontSize: 8,
                          color: Colors.white,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlanetDetailWidget(
                                planet: planets[index],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}
