import 'package:flutter/material.dart';
import '../../domain/entities/movie.dart';

class WatchlistProvider with ChangeNotifier {
  final List<Movie> _watchlist = [];
  List<Movie> get watchlist => List.unmodifiable(_watchlist);

  bool isInWatchlist(Movie movie) {
    return _watchlist.any((m) => m.imdbId == movie.imdbId);
  }

  void toggleWatchlist(Movie movie) {
    final index = _watchlist.indexWhere((m) => m.imdbId == movie.imdbId);
    if (index >= 0) {
      _watchlist.removeAt(index);
    } else {
      _watchlist.add(movie);
    }
    notifyListeners();
  }
}
