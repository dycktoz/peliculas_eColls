import 'package:flutter/material.dart';
import 'package:peliculas_ecolls/ui/widgets/appbar_custom.dart';
import 'package:provider/provider.dart';
import 'package:peliculas_ecolls/providers/providers.dart';
import 'package:peliculas_ecolls/ui/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppbarCustom(),
            MovieSlider(
                onNextPage: () => moviesProvider.getPopularMovies(),
                title: 'Las mas Populares',
                movies: moviesProvider.popularMovies),
            MovieSlider(
                onNextPage: () => moviesProvider.getUpcomingMovies(),
                title: 'PeLiculas Proximas',
                movies: moviesProvider.upcomingMovies),
            MovieSlider(
                onNextPage: () => moviesProvider.getTopRated(),
                title: 'Los Mas Valorados',
                movies: moviesProvider.topRatedMovies),
          ],
        ),
      ),
    );
  }
}
