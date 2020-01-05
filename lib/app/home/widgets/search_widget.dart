import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sw_planets_app/app/home/home_store.dart';
import 'package:sw_planets_app/app/home/widgets/planets_list_widget.dart';
import 'package:sw_planets_app/app/shared/sw_colors.dart';

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<HomeStore>(context);

    return Observer(
      builder: (context) {
        if (store.data != null) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: _decoration(),
            child: _textFormField(context, store),
          );
        } else {
          return Container();
        }
      },
    );
  }

  void _onFieldSubmitted(BuildContext context, HomeStore store, String value) {
    store.getDataByQuery(value);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlanetsListWidget(isSearch: true),
      ),
    );
  }

  BoxDecoration _decoration() => BoxDecoration(
        color: SwColors().grey50,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      );

  TextFormField _textFormField(BuildContext context, HomeStore store) =>
      TextFormField(
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.035,
          color: Colors.white,
        ),
        textCapitalization: TextCapitalization.characters,
        decoration: InputDecoration(
          hoverColor: Colors.white,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(20),
        ),
        onFieldSubmitted: (value) => _onFieldSubmitted(context, store, value),
      );
}
