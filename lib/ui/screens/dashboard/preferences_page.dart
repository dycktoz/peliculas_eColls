import 'package:flutter/material.dart';
import 'package:peliculas_ecolls/ui/widgets/widgets.dart';

class PreferencesPage extends StatelessWidget {
  const PreferencesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FavoriteCard(),
          CardContainer(
              child: Column(
            children: [
              SizedBox(
                height: 800,
              )
            ],
          ))
        ],
      ),
    );
  }
}
