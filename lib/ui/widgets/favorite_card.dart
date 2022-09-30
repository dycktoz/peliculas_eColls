import 'package:flutter/material.dart';
import 'package:peliculas_ecolls/models/movie_save.dart';

class FavoriteCard extends StatelessWidget {
  final MovieSave movie;
  const FavoriteCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              fit: BoxFit.cover,
              placeholder: AssetImage('assets/loading.gif'),
              // image: AssetImage('assets/loading.gif'),
              image: NetworkImage(movie.fullPosterImg),
              height: 150,
              width: 110,
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
                    Expanded(
                      child: Text(
                        movie.title!,
                      ),
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
