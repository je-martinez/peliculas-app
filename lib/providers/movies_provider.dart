import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:peliculasapp/models/models.dart';

class MoviesProvider extends ChangeNotifier{

  final String _baseUrl   = 'api.themoviedb.org';
  final String _apiKey    = '52661437927a1e908b94fe6b758048cb';
  final String _language  = 'es-ES';
  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  int _popularPage = 0;

  MoviesProvider(){
    print('MoviesProvider Init');
    getOnDisplayMovie();
    getPopularMovies();
  }

  Future<String> _getJsonData(String endPoint, [int page = 1]) async{
    var url = Uri.https(_baseUrl, endPoint, 
    {
      'api_key'  : _apiKey,
      'language' :_language,
      'page'     :'$page' 
    });
    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovie() async {
    final jsonData = await _getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
    onDisplayMovies = [...nowPlayingResponse.results];
    notifyListeners();
  }

  getPopularMovies() async{
    _popularPage++;
    final jsonData = await _getJsonData('3/movie/popular', _popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);
    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }

}