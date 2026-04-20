import 'package:flutter/material.dart';
import '../../domain/entities/movie.dart';
import '../../domain/usecases/get_all_movies.dart';

enum MovieState { initial, loading, loaded, error }

class MovieProvider with ChangeNotifier {
  final GetAllMovies getAllMoviesUseCase;

  MovieProvider({required this.getAllMoviesUseCase});

  MovieState _state = MovieState.initial;
  MovieState get state => _state;

  List<Movie> _allMovies = [];
  List<Movie> get allMovies => _allMovies;

  List<Movie> get trendingMovies {
    final sorted = List<Movie>.from(_allMovies);
    sorted.sort((a, b) => b.ratingValue.compareTo(a.ratingValue));
    return sorted.take(10).toList();
  }

  Movie? get featuredMovie {
    if (_allMovies.isEmpty) return null;
    return trendingMovies.first;
  }

  List<String> get allGenres {
    final genres = _allMovies.expand((m) => m.genres).toSet().toList();
    genres.sort();
    return ['All', ...genres];
  }

  List<Movie> getMoviesByGenre(String genre) {
    if (genre == 'All') return _allMovies;
    return _allMovies.where((m) => m.genres.contains(genre)).toList();
  }

  Future<void> loadMovies() async {
    _state = MovieState.loading;
    notifyListeners();

    try {
      _allMovies = await getAllMoviesUseCase.execute();
      _state = MovieState.loaded;
    } catch (e) {
      _state = MovieState.error;
    }

    notifyListeners();
  }
}
