import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../home_store.dart';

class PlanetsListWidget extends StatefulWidget {
  @override
  _PlanetsListWidgetState createState() => _PlanetsListWidgetState();
}

class _PlanetsListWidgetState extends State<PlanetsListWidget> {
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
          if (store.isLoading || store.data == null) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: store.data?.planets?.length ?? 0,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.grey[700],
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: ListTile(
                    leading: Image.asset('assets/images/planet.png'),
                    title: Text(
                      Provider.of<HomeStore>(context).data.planets[index].name,
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
                      onPressed: () {},
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
