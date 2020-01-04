import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/home/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Star Wars Planets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.pressStart2PTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: HomePage(),
    );
  }
}
