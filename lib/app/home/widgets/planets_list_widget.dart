import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sw_planets_app/app/home/widgets/planets_list_body_widget.dart';
class PlanetsListWidget extends StatelessWidget {
  final bool isSearch;

  const PlanetsListWidget({Key key, this.isSearch = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'PLANETS',
          style: GoogleFonts.pressStart2P(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey[900],
      body: PlanetsListBodyWidget(isSearch: isSearch),
    );
  }
}
