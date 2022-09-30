import 'package:flutter/material.dart';
import 'package:peliculas_ecolls/sqflite/app_basedatos.dart';
import 'package:peliculas_ecolls/ui/widgets/widgets.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final movies = DB().getMovies();
    // print(movies);
    return SingleChildScrollView(
      child: Column(
        children: [
          FavoriteCard(),
          FavoriteCard(),
          FavoriteCard(),
          FavoriteCard(),
          FavoriteCard(),
        ],
      ),
    );
  }
}
