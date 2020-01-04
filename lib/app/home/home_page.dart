import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sw_planets_app/app/home/widgets/planets_list_widget.dart';

import 'home_store.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<HomeStore>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        elevation: 0.5,
        backgroundColor: Colors.transparent,
        label: Text(
          'VER TODOS',
          style: GoogleFonts.pressStart2P(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
        ),
        icon: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlanetsListWidget(),
            ),
          );
        },
      ),
      body: Stack(
        children: <Widget>[
          Image.asset(
            "assets/images/moon.jpg",
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Column(
                              children: [
                                Text(
                                  'STAR',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'PLANETS',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 8,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'WARS',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            "HIGHLIGHTED PLANETS",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Observer(
                          builder: (context) {
                            if (store.data != null) {
                              return Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: store.data.planets?.length ?? 0,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) => CardPlanet(
                                    title: store.data.planets[index].name,
                                    description: store
                                        .data.planets[index].residents.length
                                        .toString(),
                                  ),
                                ),
                              );
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CardPlanet extends StatelessWidget {
  const CardPlanet({
    Key key,
    @required this.title,
    @required this.description,
  }) : super(key: key);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(10),
        color: Colors.grey[900].withOpacity(0.7),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "assets/images/planet.png",
            height: 120,
            width: 120,
          ),
          SizedBox(height: 10),
          FittedBox(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 20),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              'POPULATION\n\n$description',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
