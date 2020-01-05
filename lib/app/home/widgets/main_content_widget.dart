import 'package:flutter/material.dart';
import 'package:sw_planets_app/app/home/widgets/logo_widget.dart';
import 'package:sw_planets_app/app/home/widgets/search_widget.dart';


class MainContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          LogoWidget(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          SearchWidget(),
        ],
      ),
    );
  }
}
