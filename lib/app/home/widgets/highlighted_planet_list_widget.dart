import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sw_planets_app/app/home/home_store.dart';
import 'package:sw_planets_app/app/home/widgets/planet_card_widget.dart';

class HighlightedsPlanetListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<HomeStore>(context);
    
    return Expanded(
      flex: 2,
      child: Container(
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.15,
          left: 20,
          right: 20,
          top: MediaQuery.of(context).size.height * 0.01,
        ),
        child: Observer(
          builder: (context) {
            if (store.data != null) {
              return Column(
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
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: store.data.planets?.length ?? 0,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => PlanetCardWidget(
                        planet: store.data.planets[index],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.white,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
