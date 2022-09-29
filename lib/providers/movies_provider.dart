import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_ecolls/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  String _apiKey = '554f4dc8c067133096e384bed105527f';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';

  List<Movie> popularMovies = [];
  List<Movie> upcomingMovies = [];

  Map<int, List<Cast>> moviesCast = {};

  int _popularPage = 0;

  MoviesProvider() {
    print('MoviesProvider Inicializando');
    this.getPopularMovies();
    this.getUpcomingMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    var url = Uri.https(_baseUrl, endpoint,
        {'api_key': _apiKey, 'language': _language, 'page': '$page'});
    final response = await http.get(url);
    return response.body;
  }

  getPopularMovies() async {
    _popularPage++;
    final jsonData = await _getJsonData('3/movie/popular', _popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);
    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }

  getUpcomingMovies() async {
    _popularPage++;
    final jsonData = await _getJsonData('3/movie/upcoming', _popularPage);
    final upcomingResponse = UpcomingResponse.fromJson(jsonData);
    upcomingMovies = [...upcomingMovies, ...upcomingResponse.results];
    print('a');
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    if (moviesCast.containsKey(movieId)) return moviesCast[movieId]!;
    final jsonData = await _getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(jsonData);
    moviesCast[movieId] = creditsResponse.cast;
    return creditsResponse.cast;
  }
}
