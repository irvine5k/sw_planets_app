import 'package:flutter/material.dart';
import 'package:sw_planets_app/app/home/models/planet_model.dart';
import 'package:sw_planets_app/app/home/widgets/planet_detail_widget.dart';

class PlanetCardWidget extends StatelessWidget {
  const PlanetCardWidget({Key key, @required this.planet}) : super(key: key);

  final PlanetModel planet;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlanetDetailWidget(
              planet: planet,
            ),
          ),
        );
      },
      child: Container(
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
                planet.name,
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
                'POPULATION\n\n' + planet.residents.length.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
