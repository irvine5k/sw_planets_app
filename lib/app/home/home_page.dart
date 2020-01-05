import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sw_planets_app/app/home/widgets/highlighted_planet_list_widget.dart';
import 'package:sw_planets_app/app/home/widgets/logo_widget.dart';
import 'package:sw_planets_app/app/home/widgets/planets_list_widget.dart';
import 'package:sw_planets_app/app/home/widgets/search_widget.dart';
import 'package:sw_planets_app/app/shared/sw_colors.dart';

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
        backgroundColor: SwColors().grey50,
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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Image.asset(
                "assets/images/moon.jpg",
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                margin: EdgeInsets.only(top: 70),
                child: Column(
                  children: <Widget>[
                    LogoWidget(),
                    SearchWidget(),
                    HighlightedsPlanetListWidget(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
