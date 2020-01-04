import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlanetsListWidget extends StatefulWidget {
  @override
  _PlanetsListWidgetState createState() => _PlanetsListWidgetState();
}

class _PlanetsListWidgetState extends State<PlanetsListWidget> {
  @override
  Widget build(BuildContext context) {
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
    );
  }
}
