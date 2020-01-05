import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
