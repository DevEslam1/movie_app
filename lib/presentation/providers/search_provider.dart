import 'package:flutter/material.dart';
import '../../domain/entities/movie.dart';

class SearchProvider with ChangeNotifier {
  final List<Movie> allMovies;
  
  SearchProvider({required this.allMovies});

  String _query = '';
  String get query => _query;

  List<Movie> _searchResults = [];
  List<Movie> get searchResults => _searchResults;

  void search(String query) {
    _query = query;
    if (query.isEmpty) {
      _searchResults = [];
    } else {
      _searchResults = allMovies
          .where((m) => m.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  void clearSearch() {
    _query = '';
    _searchResults = [];
    notifyListeners();
  }
}
