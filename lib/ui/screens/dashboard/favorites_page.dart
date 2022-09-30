import 'package:flutter/material.dart';
import 'package:peliculas_ecolls/models/movie_save.dart';
import 'package:peliculas_ecolls/sqflite/app_basedatos.dart';
import 'package:peliculas_ecolls/ui/widgets/widgets.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<MovieSave> movies = [];

  @override
  void initState() {
    super.initState();
    getmovies();
  }

  getmovies() async {
    movies = await DB().getMovies();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, i) {
        return FavoriteCard(
          movie: movies[i],
        );
      },
    );
  }
}
