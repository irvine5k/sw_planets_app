import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../home_store.dart';
import 'planet_detail_widget.dart';

class PlanetsListWidget extends StatefulWidget {
  @override
  _PlanetsListWidgetState createState() => _PlanetsListWidgetState();
}

class _PlanetsListWidgetState extends State<PlanetsListWidget> {
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'PLANETAS',
          style: GoogleFonts.pressStart2P(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey[900],
      body: Observer(
        builder: (context) {
          if (store.data == null) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            );
          } else {
            return ListView.builder(
              controller: _controller
                ..addListener(
                  () {
                    if (_controller.offset ==
                        _controller.position.maxScrollExtent) {
                      store.nextPageData();
                    }
                  },
                ),
              shrinkWrap: true,
              itemCount: store.data?.planets?.length ?? 0,
              itemBuilder: (context, index) {
                if (index == store.data.planets.length) {
                  return Center(
                    child: Opacity(
                      opacity: store.isLoading ? 1.0 : 0.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  );
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
                        Provider.of<HomeStore>(context)
                            .data
                            .planets[index]
                            .name,
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
                                planet: store.data.planets[index],
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
