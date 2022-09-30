import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:peliculas_ecolls/models/movie.dart';
import 'package:peliculas_ecolls/sqflite/app_basedatos.dart';
import 'package:peliculas_ecolls/ui/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)?.settings.arguments as Movie;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Map<String, dynamic> mapjson = movie.toJson();
          final jsonString = json.encode(mapjson).toString();
          int algo = await DB.saveMovie(json: jsonString);
          print(algo);
          // print(jsonString);
        },
      ),
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(movie),
          SliverList(
              delegate: SliverChildListDelegate([
            _PosterAndTitle(movie),
            _Overview(movie),
            CastingCards(movie.id),
            Text(
                'Eiusmod amet sunt et veniam sint laborum cupidatat cillum culpa velit quis nostrud sit. Duis minim in id reprehenderit reprehenderit ad culpa. Non non elit sint adipisicing aliqua qui id.'),
            Container(
              height: 800,
            ),
            Text('')
          ]))
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Movie movie;

  const _CustomAppBar(this.movie);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 400,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            color: Colors.black12,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text(
                movie.title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            )),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(movie.fullbackdropPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Movie movie;

  const _PosterAndTitle(this.movie);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Hero(
            tag: movie.heroId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                fit: BoxFit.cover,
                placeholder: AssetImage('assets/loading.gif'),
                image: NetworkImage(movie.fullPosterImg),
                height: 150,
                width: 110,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width - 200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star_outline,
                      size: 15,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'ajsdkasd',
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'aasd',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  'asdasd',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final Movie movie;

  const _Overview(this.movie);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
