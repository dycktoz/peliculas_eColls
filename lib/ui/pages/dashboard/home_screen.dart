import 'package:flutter/material.dart';
import 'package:peliculas_ecolls/providers/movies_provider.dart';
import 'package:peliculas_ecolls/ui/widgets/movie_slider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('home page')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('nn'),
            SizedBox(
              height: 50,
              width: 50,
            ),
            MovieSlider(
                onNextPage: () => moviesProvider.getPopularMovies(),
                title: 'populares',
                movies: moviesProvider.popularMovies),
            MovieSlider(
                onNextPage: () => moviesProvider.getUpcomingMovies(),
                title: 'proximos',
                movies: moviesProvider.upcomingMovies),
          ],
        ),
      ),
    );
  }
}
