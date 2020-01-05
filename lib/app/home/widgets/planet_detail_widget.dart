import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sw_planets_app/app/home/models/planet_model.dart';

class PlanetDetailWidget extends StatelessWidget {
  final PlanetModel planet;

  const PlanetDetailWidget({Key key, @required this.planet}) : super(key: key);

  String format(String value) {
    String newValue = value;
    int cont = 0;

    try {
      int.parse(value);
      for (var i = value.length - 1; i > 0; i--) {
        cont++;
        if (cont % 3 == 0) {
          newValue = newValue.replaceRange(i, i, ".");
        } else {}
      }
    } catch (e) {
      return value;
    }

    return newValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          planet.name,
          style: GoogleFonts.pressStart2P(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey[900],
      body: ListView(
        children: <Widget>[
          SizedBox(height: 70),
          Image.asset(
            "assets/images/planet.png",
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.width * 0.4,
          ),
          TextPlanetDetailWidget(
            title: "Rotation Period",
            description: planet.rotationPeriod + " Days",
          ),
          TextPlanetDetailWidget(
            title: "Orbital Period",
            description: planet.orbitalPeriod + " Days",
          ),
          TextPlanetDetailWidget(
            title: "Terrain",
            description: planet.terrain,
          ),
          TextPlanetDetailWidget(
            title: "Population",
            description: format(planet.population),
          ),
        ],
      ),
    );
  }
}

class TextPlanetDetailWidget extends StatelessWidget {
  const TextPlanetDetailWidget({
    Key key,
    @required this.title,
    @required this.description,
  }) : super(key: key);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 35),
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
        SizedBox(height: 15),
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            description,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
