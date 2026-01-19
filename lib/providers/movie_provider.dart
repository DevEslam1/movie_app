import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/utils/movie_parser.dart';

class MovieProvider extends ChangeNotifier {
  List<Movie> _movieList = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Movie> get movieList => _movieList;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> loadMovies() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final jsonString = await rootBundle.loadString('assets/data/films.json');

      final movies = MovieParser.parse(jsonString);

      _movieList = movies;
    } catch (e) {
      _errorMessage = 'Error loading movies: $e';
      debugPrint(_errorMessage);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
